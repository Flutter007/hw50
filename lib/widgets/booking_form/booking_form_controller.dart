import 'package:flutter/material.dart';

class BookingFormController {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final nameOfBookerController = TextEditingController();
  final dateOfStartController = TextEditingController();
  final timeOfStartController = TextEditingController();
  final dateOfEndController = TextEditingController();
  final timeOfEndController = TextEditingController();

  void dispose() {
    titleController.dispose();
    nameOfBookerController.dispose();
    dateOfStartController.dispose();
    dateOfEndController.dispose();
    timeOfStartController.dispose();
    timeOfEndController.dispose();
  }
}
