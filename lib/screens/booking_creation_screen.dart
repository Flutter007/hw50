import 'package:flutter/material.dart';
import 'package:hw50/widgets/booking_form/booking_form.dart';

class BookingCreationScreen extends StatefulWidget {
  const BookingCreationScreen({super.key});

  @override
  State<BookingCreationScreen> createState() => _BookingCreationScreenState();
}

class _BookingCreationScreenState extends State<BookingCreationScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create some booking!')),
      body: Center(child: BookingForm()),
    );
  }
}
