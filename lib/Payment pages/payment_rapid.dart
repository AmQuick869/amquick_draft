import 'package:amquick_draft/Payment%20pages/payment_done.dart';
import 'package:flutter/material.dart';

class Checkout7Widget extends StatefulWidget {
  const Checkout7Widget({super.key});

  @override
  State<Checkout7Widget> createState() => _Checkout7WidgetState();
}

class _Checkout7WidgetState extends State<Checkout7Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFFF1F4F8),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120),
          child: AppBar(
            backgroundColor: const Color(0xFFF1F4F8),
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 8),
                    child: Row(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Color(0xFF14181B),
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                          child: Text(
                            'Back',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF14181B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                    child: Text(
                      'Payment',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        color: Color(0xFF14181B),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        children: [
                          _buildServiceCard('Rapid Ambulance', 'Rs. 1999'),
                          _buildServiceCard('Doctor Appointment', 'Rs. 799'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 16, 24, 4),
                      child: Row(
                        children: [
                          Text(
                            'Price Breakdown',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              color: Color(0xFF14181B),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Appointment',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              color: Color(0xFF57636C),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rs. 799',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ambulance',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Rs. 1999',
                            style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFF57636C),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 4, 24, 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF14181B),
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Rs. 2798',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              color: Color(0xFF14181B),
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Container(
                      width: 200,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFF4B39EF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: AlignmentDirectional.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentWidget()),
                          );
                        },
                        child: const Text(
                          'Pay (Rs. 2799)',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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

  Widget _buildServiceCard(String title, String price) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x320E151B),
              offset: Offset(0, 1),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: 'Arial',
                          color: Color(0xFF14181B),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: 'Arial',
                        color: Color(0xFF57636C),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF57636C),
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
