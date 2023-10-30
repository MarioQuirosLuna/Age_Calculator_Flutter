import 'package:flutter/material.dart';

class SummaryColumn extends StatelessWidget {
  final String topLabel;
  final int topData;
  final String bottomLabel;
  final int bottomData;

  const SummaryColumn({
    super.key,
    required this.topLabel,
    required this.topData,
    required this.bottomLabel,
    required this.bottomData
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(topLabel, style: Theme.of(context).textTheme.titleMedium),
        Text('$topData', style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 10),
        Text(bottomLabel, style: Theme.of(context).textTheme.titleMedium),
        Text('$bottomData', style: Theme.of(context).textTheme.labelSmall),
      ],
    );
  }
}