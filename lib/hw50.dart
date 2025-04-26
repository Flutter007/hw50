import 'package:flutter/material.dart';
import 'package:hw50/app_routes.dart';
import 'package:hw50/screens/booking_creation_screen.dart';
import 'package:hw50/screens/booking_list_screen.dart';

class Hw50 extends StatelessWidget {
  const Hw50({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => BookingListScreen(),
        AppRoutes.creation: (ctx) => BookingCreationScreen(),
      },
    );
  }
}
