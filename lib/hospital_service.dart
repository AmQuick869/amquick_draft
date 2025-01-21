import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart'; 
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HospitalService {
  final CollectionReference hospitalsCollection =
      FirebaseFirestore.instance.collection('hospitals');

  Future<Map<String, dynamic>> getUserLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return {
      "latitude": position.latitude,
      "longitude": position.longitude,
    };
  }

  Future<String> getCityFromCoordinates(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        return placemarks[0].locality ?? ''; // Use locality for city name
      } else {
        return 'Unknown City';
      }
    } catch (e) {
      print('Error getting city name: $e');
      return 'Unknown City';
    }
  }

  Future<List<Map<String, dynamic>>> fetchNearbyHospitals(
      double latitude, double longitude, String cityName) async {
    const nominatimUrl = 'https://nominatim.openstreetmap.org/search';

    final queryParameters = {
      'q': 'hospital, $cityName',
      'format': 'json',
      'lat': latitude.toString(),
      'lon': longitude.toString(),
      'radius': '1000', // Search within 5km radius
      'limit': '2', // Limit results to 10 hospitals
    };

    final uri = Uri.https(Uri.parse(nominatimUrl).host, Uri.parse(nominatimUrl).path, queryParameters);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      return data.map((hospital) {
        return {
          "name": hospital['display_name'],
          "latitude": double.parse(hospital['lat']),
          "longitude": double.parse(hospital['lon']),
        };
      }).toList();
    } else {
      throw Exception('Failed to fetch hospitals: ${response.statusCode}');
    }
  }

  Future<void> updateHospitalsInFirestore(List<Map<String, dynamic>> hospitals,
      double userLat, double userLon) async {
    for (var hospital in hospitals) {
      double distance = calculateDistance(
          userLat, userLon, hospital["latitude"], hospital["longitude"]);

      final query = await hospitalsCollection
          .where("name", isEqualTo: hospital["name"])
          .get();

      if (query.docs.isNotEmpty) {
        await query.docs.first.reference.update({
          "distance": distance.toStringAsFixed(2),
          "location": GeoPoint(hospital["latitude"], hospital["longitude"]),
          "priceRange": "${Random().nextInt(100) + 50}" // Example price range
        });
      } else {
        await hospitalsCollection.add({
          "name": hospital["name"],
          "distance": distance.toStringAsFixed(2),
          "location": GeoPoint(hospital["latitude"], hospital["longitude"]),
          "priceRange": "${Random().nextInt(100) + 50}" // Example price range
        });
      }
    }
  }

  double calculateDistance(
      double lat1, double lon1, double lat2, double lon2) {
    const earthRadius = 6371; // Earth radius in KM
    double dLat = _degreesToRadians(lat2 - lat1);
    double dLon = _degreesToRadians(lon2 - lon1);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(lat1)) *
            cos(_degreesToRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  Future<void> fetchAndUpdateHospitals() async {
    try {
      final userLocation = await getUserLocation();
      final latitude = userLocation["latitude"]!;
      final longitude = userLocation["longitude"]!;

      String cityName = await getCityFromCoordinates(latitude, longitude);

      final hospitals = await fetchNearbyHospitals(latitude, longitude, cityName);

      await updateHospitalsInFirestore(hospitals, latitude, longitude);

      print("Hospitals successfully updated in Firestore.");
    } catch (e) {
      print("Error fetching and updating hospitals: $e");
    }
  }
}