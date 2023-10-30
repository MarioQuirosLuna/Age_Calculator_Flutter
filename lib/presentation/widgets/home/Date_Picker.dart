import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  final String title;
  final DateTime date;
  final Function(DateTime) onDateChanged;

  DatePicker({
    super.key,
    required this.title,
    required this.date,
    required this.onDateChanged
  });

  final List<String> _months = [
    'months','January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November','December'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text('${date.day} ${_months[date.month]} ${date.year}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    onDateChanged(date);
                  },
                  child: const Icon(
                    Icons.calendar_today,
                  )
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}