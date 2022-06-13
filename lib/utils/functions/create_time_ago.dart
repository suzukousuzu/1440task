int createTimeAgo(DateTime selectedTime) {
  final _now = DateTime.now();

  final difference = selectedTime.difference(_now).inSeconds;

  if (difference == 0) {
    return 0;
  } else if (difference < 0) {
    return 1;
  } else if (difference > 86400) {
    return 86400;
  }
  return difference;
}
