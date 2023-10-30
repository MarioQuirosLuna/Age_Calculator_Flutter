import 'package:flutter/material.dart';

class ExactAge extends StatelessWidget{
  final DateTime todayDate;
  final DateTime birthDate;
  const ExactAge({
    super.key,
    required this.todayDate,
    required this.birthDate
  });

  // Exact Age in years, months and days
  List<int> getAge(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (days < 0) {
      months--;
      final lastMonth = currentDate.month - 1;
      days += DateTime(currentDate.year, lastMonth == 0 ? 12 : lastMonth, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return [years, months, days];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              'Age',
              style: Theme.of(context).textTheme.titleMedium
          ),
          Text(
              '${getAge(birthDate, todayDate)[0]}',
              style: Theme.of(context).textTheme.labelLarge
          ),
          Text(
              'Years',
              style: Theme.of(context).textTheme.titleMedium
          ),
          Text(
              '${getAge(birthDate, todayDate)[1]} Months | ${getAge(birthDate, todayDate)[2]} Days',
              style: Theme.of(context).textTheme.titleMedium
          ),
        ],
      ),
    );
  }
}