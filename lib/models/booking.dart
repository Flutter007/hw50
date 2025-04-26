class Booking {
  final String title;
  final String nameOfBooker;
  final DateTime dateOfStart;
  final DateTime dateOfEnd;

  Booking({
    required this.title,
    required this.nameOfBooker,
    required this.dateOfStart,
    required this.dateOfEnd,
  });

  Booking copyWith({
    String? title,
    String? nameOfBooker,
    DateTime? dateOfStart,
    DateTime? dateOfEnd,
  }) {
    return Booking(
      title: title ?? this.title,
      nameOfBooker: nameOfBooker ?? this.nameOfBooker,
      dateOfStart: dateOfStart ?? this.dateOfStart,
      dateOfEnd: dateOfEnd ?? this.dateOfEnd,
    );
  }
}
