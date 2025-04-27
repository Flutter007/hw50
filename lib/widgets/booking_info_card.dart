import 'package:flutter/material.dart';
import 'package:hw50/models/booking.dart';

import '../helpers/formatted_datetime.dart';
import 'custom_text.dart';

class BookingInfoCard extends StatelessWidget {
  final Booking booking;
  const BookingInfoCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(txt: 'Booker: ${booking.nameOfBooker}'),
                      CustomText(txt: 'Title: ${booking.title}'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomText(
                      txt: 'Starts : ${formattedDateTime(booking.dateOfStart)}',
                    ),
                    CustomText(
                      txt: 'Ends : ${formattedDateTime(booking.dateOfEnd)}',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
