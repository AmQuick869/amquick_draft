import 'package:amquick_draft/select_amb.dart';
import 'package:amquick_draft/video_call.dart';
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({super.key});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 16),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF57636C),
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SelectAmbulanceWidget()));
                    },
                    iconSize: 44,
                    padding: const EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: const Color(0x4C4B39EF),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF4B39EF),
                  width: 2,
                ),
              ),
              alignment: AlignmentDirectional.center,
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Icon(
                  Icons.check_rounded,
                  color: Color(0xFF4B39EF),
                  size: 60,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
              child: Text(
                'Payment Confirmed!',
                style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Color(0xFF4B39EF),
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24, 8, 24, 0),
              child: Text(
                'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transaction list.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Arial',
                  color: Color(0xFF57636C),
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const VideoCallWidget()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 125, 73, 222),
                        fixedSize: const Size(230, 50),
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Make the Video Call',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
