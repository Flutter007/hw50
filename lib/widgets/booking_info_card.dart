import 'package:flutter/material.dart';
import 'package:hw50/models/booking.dart';

import '../helpers/formatted_datetime.dart';

class BookingInfoCard extends StatelessWidget {
  final Booking booking;
  const BookingInfoCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(booking.nameOfBooker), Text(booking.title)],
          ),
          Row(
            children: [
              Text(formattedDateTime(booking.dateOfStart)),
              Text(formattedDateTime(booking.dateOfEnd)),
            ],
          ),
        ],
      ),
    );
  }
}
