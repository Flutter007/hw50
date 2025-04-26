import 'package:flutter/material.dart';
import 'package:hw50/models/booking.dart';

class BookingListProvider extends ChangeNotifier {
  List<Booking> _bookings = [];

  List<Booking> get bookings => _bookings;

  void addBooking(Booking newBooking) {
    _bookings = [..._bookings, newBooking];
    notifyListeners();
  }
}
