
class WHospitalModel {
  // Define any properties related to the hospital data
  String hospitalName;
  String location;
  String contactNumber;
  bool isAvailable;

  // Constructor to initialize the model with default values
  WHospitalModel({
    this.hospitalName = '',
    this.location = '',
    this.contactNumber = '',
    this.isAvailable = false,
  });

  // Method to update hospital details
  void updateHospitalDetails({
    required String name,
    required String location,
    required String contact,
    required bool availability,
  }) {
    hospitalName = name;
    location = location;
    contactNumber = contact;
    isAvailable = availability;
  }

  // Optionally, you can add methods to fetch data from an API or local storage if needed.
  // Future<void> fetchData() async {
  //   // Your fetch logic here
  // }

  // Dispose method if needed (for cleaning up resources)
  void dispose() {
    // Clean up if any resources need to be freed
  }

  // A method to represent the hospital as a string or JSON, useful for debugging or API responses
  @override
  String toString() {
    return 'Hospital: $hospitalName, Location: $location, Contact: $contactNumber, Available: $isAvailable';
  }
}
