import 'package:flutter/material.dart';
import 'package:hw50/app_routes.dart';
import 'package:hw50/provider/booking_list_provider.dart';
import 'package:hw50/screens/booking_creation_screen.dart';
import 'package:hw50/screens/booking_list_screen.dart';
import 'package:hw50/screens/not_found_screen.dart';
import 'package:provider/provider.dart';

class Hw50 extends StatelessWidget {
  const Hw50({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => BookingListProvider(),
      child: MaterialApp(
        initialRoute: AppRoutes.home,
        routes: {
          AppRoutes.home: (ctx) => BookingListScreen(),
          AppRoutes.creation: (ctx) => BookingCreationScreen(),
        },
        onUnknownRoute:
            (settings) => MaterialPageRoute(builder: (ctx) => NotFoundScreen()),
      ),
    );
  }
}
