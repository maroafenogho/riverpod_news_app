extension GetDate on String {
  String get getDate {
    DateTime receivedTime = DateTime.parse(this);

    return '${receivedTime.day}-${receivedTime.month}-${receivedTime.year} ${receivedTime.hour}:-${receivedTime.minute}';
  }
}
