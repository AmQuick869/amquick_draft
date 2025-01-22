import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class MedicalReportPage extends StatefulWidget {
  const MedicalReportPage({super.key});

  @override
  _MedicalReportPageState createState() => _MedicalReportPageState();
}

class _MedicalReportPageState extends State<MedicalReportPage> {
  File? _selectedPdf;

  String insights = "";

  bool _isLoading = false;

  Future<void> uploadFile() async {
    try {
      // Pick file
      print('Picking file...');
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result == null) {
        print('No file selected.');
        return;
      }

      File file = File(result.files.single.path!);
      print('File selected: ${file.path}');

      _isLoading = true;
      setState(() {

      });

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://fastapirender-6.onrender.com/generate-report/'),
      );
      print('Request created.');

      // Attach file
      request.files.add(await http.MultipartFile.fromPath('file', file.path));
      print('File attached to the request.');

      // Send request
      var response = await request.send();
      print('Request sent. Response code: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Get the response as bytes
        var responseBody = await response.stream.bytesToString();
        final data = jsonDecode(responseBody);
        insights = data["insights"];

        _isLoading = false;
        
        setState(() {

        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading ? Center(child: CircularProgressIndicator(color: Colors.teal,),) : Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                        child: Text(
                          'AmQuick',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            fontSize: 23,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () async {
                  print('Button pressed, picking PDF...');
                    await uploadFile();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                ),
                child: Text(
                  'Upload PDF Report',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Insights:',
                      style:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [Text(
                            insights == "" ?
                            'Insights will be displayed here after processing the report.' : insights,
                            style: TextStyle(
                                fontSize: 14,
                                color: const Color.fromARGB(255, 52, 52, 52)),
                          ),]
                        ),
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
