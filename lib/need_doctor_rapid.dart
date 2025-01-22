import 'package:amquick_draft/Payment%20pages/payment_rapid.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'need_doctor_model.dart';
export 'need_doctor_model.dart';

T createModel<T>(BuildContext context, T Function() modelCreator) {
  return modelCreator();
}

class NeedDoctorWidget extends StatefulWidget {
  const NeedDoctorWidget({super.key});

  @override
  State<NeedDoctorWidget> createState() => _NeedDoctorWidgetState();
}

class _NeedDoctorWidgetState extends State<NeedDoctorWidget> {
  late NeedDoctorModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  // Define a constant image URL for all doctors
  final String defaultImageUrl =
      'https://img.freepik.com/premium-photo/doctor-having-good-news-his-patient_13339-193678.jpg?semt=ais_hybrid';

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NeedDoctorModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),
                  alignment: AlignmentDirectional(-1, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
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
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0x2F000000),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                            size: 17,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Color(0x2F000000),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            Icons.notifications_none,
                            color: Colors.black,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('doctors')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final doctors = snapshot.data!.docs;

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: doctors.length,
                        itemBuilder: (context, index) {
                          final doctor = doctors[index];
                          final doctorName = doctor['name'];
                          final specialization = doctor['specialization'];
                          final rating = doctor['rating'];
                          final price = doctor['price'];

                          return Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 5, 25, 5),
                            child: Container(
                              width: 100,
                              height: 270,
                              constraints: BoxConstraints(
                                minWidth: double.infinity,
                                maxWidth: double.infinity,
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(100, 16, 93, 251),
                                    Color.fromARGB(100, 138, 199, 255)
                                  ],
                                  stops: [0, 1],
                                  begin: AlignmentDirectional(0.17, -1),
                                  end: AlignmentDirectional(-0.17, 1),
                                ),
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: Color(0xBE0E58DA),
                                  width: 1,
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Checkout7Widget()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  padding: EdgeInsets.zero,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(24),
                                      child: Image.network(
                                        defaultImageUrl, // Use the constant image URL
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 15, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[50],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star_rate_rounded,
                                                        color:
                                                            Color(0xFFEA8B18),
                                                        size: 24,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
                                                        child: Text(
                                                          rating.toString(),
                                                          style: TextStyle(
                                                            fontFamily: 'Inter',
                                                            fontSize: 14,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 70, 0, 0),
                                            child: Text(
                                              doctorName,
                                              style: TextStyle(
                                                fontFamily: 'Ubuntu',
                                                fontSize: 25,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 30, 0, 0),
                                              child: RichText(
                                                textScaler:
                                                    MediaQuery.of(context)
                                                        .textScaler,
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: '  $price',
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        letterSpacing: 0.0,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    )
                                                  ],
                                                  style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontSize: 12,
                                                    letterSpacing: 0.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 105, 0, 0),
                                      child: Text(
                                        specialization,
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
