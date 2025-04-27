import 'package:flutter/material.dart';
import 'package:hw50/widgets/booking_info_card.dart';
import 'package:provider/provider.dart';

import '../models/booking.dart';
import '../provider/booking_list_provider.dart';

class BookingListScreen extends StatefulWidget {
  const BookingListScreen({super.key});

  @override
  State<BookingListScreen> createState() => _BookingListScreenState();
}

class _BookingListScreenState extends State<BookingListScreen> {
  late BookingListProvider bookingListProvider;
  late List<Booking> bookings;

  void goToCreation() async {
    await Navigator.of(context).pushNamed('/creation');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bookingListProvider = context.watch<BookingListProvider>();
    bookings = bookingListProvider.bookings;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View of Bookings'),
        actions: [
          IconButton(onPressed: goToCreation, icon: Icon(Icons.add, size: 30)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          bookings.isEmpty
              ? Center(child: Text('No bookings yet'))
              : Expanded(
                child: ListView.builder(
                  itemCount: bookings.length,
                  itemBuilder:
                      (ctx, index) => BookingInfoCard(booking: bookings[index]),
                ),
              ),
        ],
      ),
    );
  }
}
