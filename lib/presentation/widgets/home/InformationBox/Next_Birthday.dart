import 'package:flutter/material.dart';

class NextBirtday extends StatelessWidget {
  final DateTime todayDate;
  final DateTime birthDate;

  const NextBirtday({
    super.key,
    required this.todayDate,
    required this.birthDate
  });

  // Next Birthday day of the week
  String getNextDayOfBirth(DateTime birthDate, DateTime currentDate) {
    final daysOfWeek = ['days', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday','Sunday'];
    DateTime date = DateTime(currentDate.year+1,birthDate.month,birthDate.day);

    return daysOfWeek[date.weekday];
  }

  // Months and days until next birthday
  List<int> daysUntilNextBirthday(DateTime birthDate, DateTime currentDate) {
    DateTime nextBirthday = DateTime(currentDate.year, birthDate.month, birthDate.day);

    if (nextBirthday.isBefore(currentDate)) {
      nextBirthday = DateTime(currentDate.year + 1, birthDate.month, birthDate.day);
    }

    int yearsUntil = nextBirthday.year - currentDate.year;
    int monthsUntil = nextBirthday.month - currentDate.month;
    int daysUntil = nextBirthday.day - currentDate.day;

    if (daysUntil < 0) {
      monthsUntil--;
      final lastMonth = DateTime(currentDate.year, currentDate.month + 1, 0);
      daysUntil = lastMonth.day - currentDate.day + nextBirthday.day;
    }

    if (monthsUntil < 0) {
      yearsUntil--;
      monthsUntil += 12;
    }

    return [monthsUntil, daysUntil];
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Next Birthday', style: Theme.of(context).textTheme.titleMedium),
          Icon(Icons.cake_rounded, size: 60, color: Theme.of(context).colorScheme.inversePrimary),
          Text(getNextDayOfBirth(birthDate, todayDate), style: Theme.of(context).textTheme.titleMedium),
          Text(
              '${daysUntilNextBirthday(birthDate,todayDate)[0]} Months '
                  '| ${daysUntilNextBirthday(birthDate,todayDate)[1]} days',
              style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
    );
  }
}