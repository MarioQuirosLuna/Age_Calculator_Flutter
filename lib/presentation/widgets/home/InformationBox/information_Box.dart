import 'package:flutter/material.dart';

import 'exact_Age.dart';
import 'next_Birthday.dart';
import 'summary_Column.dart';

class InformationBox extends StatelessWidget {
  final DateTime todayDate;
  final DateTime birthDate;
  const InformationBox({
    super.key,
    required this.todayDate,
    required this.birthDate
  });

  // Age in different units
  int getAgeInYears(DateTime birthDate, DateTime currentDate) {
    final difference = currentDate.difference(birthDate).inDays;
    final ageInYears = difference ~/ 365;
    return ageInYears;
  }
  int getAgeInMonths(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    int days = currentDate.day - birthDate.day;

    if (days < 0) {
      months--;
      days += DateTime(currentDate.year, currentDate.month - 1, 0).day;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    int ageInMonths = years * 12 + months;
    return ageInMonths;
  }
  int getAgeInWeeks(DateTime birthDate, DateTime currentDate) {
    final difference = currentDate.difference(birthDate).inDays;
    final ageInWeeks = difference ~/ 7;
    return ageInWeeks;
  }
  int getAgeInDays(DateTime birthDate, DateTime currentDate) {
    final difference = currentDate.difference(birthDate).inDays;
    return difference;
  }
  int getAgeInHours(DateTime birthDate, DateTime currentDate) {
    final difference = currentDate.difference(birthDate).inHours;
    return difference;
  }
  int getAgeInMinutes(DateTime birthDate, DateTime currentDate) {
    final difference = currentDate.difference(birthDate).inMinutes;
    return difference;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ExactAge(todayDate: todayDate, birthDate: birthDate),
                Container(
                  height: 160,
                  width: 1,
                  color: Colors.black,
                ),
                NextBirtday(todayDate: todayDate, birthDate: birthDate),
              ]
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.black,
            margin: const EdgeInsets.symmetric(horizontal: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Summary', style: Theme.of(context).textTheme.labelMedium),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SummaryColumn(
                    topLabel: 'Years',
                    topData: getAgeInYears(birthDate, todayDate),
                    bottomLabel: 'Days',
                    bottomData: getAgeInDays(birthDate, todayDate)
                ),
                SummaryColumn(
                    topLabel: 'Month',
                    topData: getAgeInMonths(birthDate, todayDate),
                    bottomLabel: 'Hours',
                    bottomData: getAgeInHours(birthDate, todayDate)
                ),
                SummaryColumn(
                  topLabel: 'Weeks',
                  topData: getAgeInWeeks(birthDate, todayDate),
                  bottomLabel: 'Minutes',
                  bottomData: getAgeInMinutes(birthDate, todayDate)
                ),
              ]
          ),
        ],
      ),
    );
  }
}