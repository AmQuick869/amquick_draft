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

      // Create request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://fastapirender-5.onrender.com/generate-report'),
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
        var bytes = await response.stream.toBytes();
        print('Response received. Saving PDF...');

        // Save the PDF file
        final directory = await getApplicationDocumentsDirectory();
        File pdfFile = File('${directory.path}/Patient_Advice.pdf');
        await pdfFile.writeAsBytes(bytes);

        print('PDF saved at: ${pdfFile.path}');
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  Future<void> _pickPdf() async {
    final result = await FilePicker.platform
        .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);

    if (result != null && result.files.single.path != null) {
      setState(() {
        _selectedPdf = File(result.files.single.path!);
      });
      print('PDF file selected: ${_selectedPdf!.path}');
    } else {
      print('No PDF file selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                  await _pickPdf();
                  if (_selectedPdf != null) {
                    print('Selected PDF: ${_selectedPdf!.path}');
                    await uploadFile();
                  } else {
                    print('No PDF selected, cannot upload.');
                  }
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
              if (_selectedPdf != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected File:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      _selectedPdf!.path.split('/').last,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Insights:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 200,
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.teal),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Insights will be displayed here after processing the report.',
                        style: TextStyle(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 52, 52, 52)),
                      ),
                    ),
                  ],
                )
              else
                Text(
                  'No file selected. Please upload a PDF report to view insights.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
