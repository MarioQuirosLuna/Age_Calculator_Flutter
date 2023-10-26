import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Age Calculator'),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              _DatePicker(title: 'Today',),
              _DatePicker(title: 'Date of Birth',),
              SizedBox(height: 40),
              _InformationBox(),
            ]
          ),
        ),
      ),
    );
  }
}

class _InformationBox extends StatelessWidget {
  const _InformationBox({
    super.key,
  });

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
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Age', style: Theme.of(context).textTheme.titleMedium),
                      Text('20', style: Theme.of(context).textTheme.labelLarge),
                      Text('Years', style: Theme.of(context).textTheme.titleMedium),
                      Text('0 Months | 0 Days', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                Container(
                  height: 160,
                  width: 1,
                  color: Colors.black,
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Next Birthday', style: Theme.of(context).textTheme.titleMedium),
                      Icon(Icons.cake_rounded, size: 60, color: Theme.of(context).colorScheme.inversePrimary),
                      Text('Friday', style: Theme.of(context).textTheme.titleMedium),
                      Text('0 Months | 0 Days', style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
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
                Column(
                  children: [
                    Text('Years', style: Theme.of(context).textTheme.titleMedium),
                    Text('20', style: Theme.of(context).textTheme.labelSmall),
                    Text('Days', style: Theme.of(context).textTheme.titleMedium),
                    Text('7607', style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
                Column(
                  children: [
                    Text('Month', style: Theme.of(context).textTheme.titleMedium),
                    Text('249', style: Theme.of(context).textTheme.labelSmall),
                    Text('Hours', style: Theme.of(context).textTheme.titleMedium),
                    Text('182587', style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
                Column(
                  children: [
                    Text('Weeks', style: Theme.of(context).textTheme.titleMedium),
                    Text('1086', style: Theme.of(context).textTheme.labelSmall),
                    Text('Minutes', style: Theme.of(context).textTheme.titleMedium),
                    Text('11466720', style: Theme.of(context).textTheme.labelSmall),
                  ],
                ),
              ]
          ),
        ],
      ),
    );
  }
}

class _DatePicker extends StatelessWidget {
  final String title;
  const _DatePicker({
    super.key,
    required this.title,
  });

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
                  child: Text('25 October 2023',
                      style: TextStyle(
                        fontSize: 20,
                          fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary
                      )
                  ),
                ),
                const Icon(Icons.calendar_today,)
              ],
            ),
          ],
        ),
      ],
    );
  }
}