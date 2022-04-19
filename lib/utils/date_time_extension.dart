extension DateTimeExt on DateTime {
  bool isSameDay(DateTime dateTime) =>
      day == dateTime.day && month == dateTime.month && year == dateTime.year;
}

extension DateTimeListExt on List<DateTime> {
  bool containsDay(DateTime dateTime) =>
      where((element) => element.isSameDay(dateTime)).isNotEmpty;
}
