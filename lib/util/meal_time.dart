
String currentMeal() {
  final now = DateTime.now().hour;
  if (now < 12) {
    return 'Breakfast';
  } else if (now < 18) {
    return 'Lunch';
  } else {
    return 'Dinner';
  }
}
