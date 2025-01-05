import 'package:flutter/material.dart';

class NeedDoctorModel {
  final TextEditingController controller = TextEditingController();

  void dispose() {
    controller.dispose(); // Cleanup controller
  }
}
