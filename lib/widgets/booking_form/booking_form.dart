import 'package:flutter/material.dart';
import 'package:hw50/models/booking.dart';
import 'package:provider/provider.dart';
import '../../helpers/formatted_datetime.dart';
import '../../provider/booking_list_provider.dart';
import '../custom_text_form_field.dart';
import 'booking_form_controller.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  DateTime selectedDateOfStart = DateTime.now();
  DateTime selectedDateOfEnd = DateTime.now();
  TimeOfDay? selectedTimeOfStart;
  TimeOfDay? selectedTimeOfEnd;
  final controller = BookingFormController();

  @override
  void initState() {
    super.initState();
    controller.dateOfStartController.text = formattedDate(selectedDateOfStart);
  }

  DateTime getDateTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  void createBooking() {
    final listProvider = context.read<BookingListProvider>();
    if (controller.formKey.currentState!.validate()) {
      DateTime dateOfStart;
      DateTime dateOfEnd;
      dateOfStart = getDateTime(selectedDateOfStart, selectedTimeOfStart!);
      dateOfEnd = getDateTime(selectedDateOfEnd, selectedTimeOfEnd!);
      final booking = Booking(
        title: controller.titleController.text,
        nameOfBooker: controller.nameOfBookerController.text,
        dateOfStart: dateOfStart,
        dateOfEnd: dateOfEnd,
      );
      listProvider.addBooking(booking);
    }
  }

  void onDateOfStartTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day + 1);
    final userDateOfStart = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDateOfStart,
    );
    if (userDateOfStart != null) {
      setState(() {
        selectedDateOfStart = userDateOfStart;
        controller.dateOfStartController.text = formattedDate(
          selectedDateOfStart,
        );
      });
    }
  }

  void onTimeStartTap() async {
    final userTimeOfStart = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfStart ?? TimeOfDay.now(),
    );
    if (userTimeOfStart != null) {
      setState(() {
        selectedTimeOfStart = userTimeOfStart;
        controller.timeOfStartController.text = formattedTime(userTimeOfStart);
        selectedTimeOfEnd = TimeOfDay(
          hour: userTimeOfStart.hour + 1,
          minute: userTimeOfStart.minute,
        );
        controller.timeOfEndController.text = formattedTime(selectedTimeOfEnd);
      });
    }
  }

  void onDateOfEndTap() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day + 1);
    final userDateOfEnd = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDate: selectedDateOfEnd,
    );
    if (userDateOfEnd != null) {
      setState(() {
        selectedDateOfEnd = userDateOfEnd;
        controller.dateOfEndController.text = formattedDate(selectedDateOfEnd);
      });
    }
  }

  void onTimeEndTap() async {
    final userTimeOfEnd = await showTimePicker(
      context: context,
      initialTime: selectedTimeOfEnd ?? TimeOfDay.now(),
    );
    if (userTimeOfEnd != null) {
      setState(() {
        selectedTimeOfEnd = userTimeOfEnd;
        controller.timeOfEndController.text = formattedTime(userTimeOfEnd);
      });
    }
  }

  // void goToHome() {
  //   Navigator.pop(context);
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<BookingListProvider>();
    return Form(
      key: controller.formKey,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: controller.nameOfBookerController,
              labelText: 'Name of booker : ',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            CustomTextFormField(
              controller: controller.titleController,
              labelText: 'Title : ',
              validator: (value) {
                if (value == null || value.trim().length < 3) {
                  return 'Title is too short';
                }
                return null;
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.dateOfStartController,
                      decoration: InputDecoration(labelText: 'Date of start :'),
                      readOnly: true,
                      onTap: onDateOfStartTap,
                      validator: (value) {
                        for (var booking in provider.bookings) {
                          if (booking.dateOfStart.isAfter(
                            selectedDateOfStart,
                          )) {
                            return 'Date of start is not valid';
                          }
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: TextFormField(
                      controller: controller.timeOfStartController,
                      decoration: InputDecoration(labelText: 'Time of start'),
                      onTap: onTimeStartTap,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.dateOfEndController,
                      decoration: InputDecoration(labelText: 'Date of end :'),
                      readOnly: true,
                      onTap: onDateOfEndTap,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 40),
                  Expanded(
                    child: TextFormField(
                      controller: controller.timeOfEndController,
                      decoration: InputDecoration(labelText: 'Time of end'),
                      onTap: onTimeEndTap,
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: createBooking, child: Text('Create')),
          ],
        ),
      ),
    );
  }
}
