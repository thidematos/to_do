String formatDate(DateTime timestamp) {
  return '${timestamp.day.toString().padLeft(2, '0')}/${timestamp.month.toString().padLeft(2, '0')}/${timestamp.year.toString()}';
}
