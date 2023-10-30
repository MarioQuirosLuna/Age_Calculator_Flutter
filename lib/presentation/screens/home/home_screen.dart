import 'package:flutter/material.dart';
import 'package:age_calculator/presentation/widgets/home/InformationBox/Information_Box.dart';
import 'package:age_calculator/presentation/widgets/home/Date_Picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DateTime _todayDate = DateTime.now().toLocal();
  DateTime _birthDate = DateTime(2000,12,1);

  Future<void> _selectTodayDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _todayDate,
        firstDate: _birthDate,
        lastDate: _todayDate
    );
    if (picked != null && picked != _todayDate) {
      setState(() {
         _todayDate = picked;
      });
    }
  }
  Future<void> _selectDOBDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _birthDate,
        firstDate: DateTime(1900,1,1),
        lastDate: _todayDate
    );
    if (picked != null && picked != _todayDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Age Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              DatePicker(
                title: 'Today',
                date: _todayDate,
                onDateChanged: (date) => _selectTodayDate(context),
              ),
              DatePicker(
                title: 'Date of Birth',
                date: _birthDate,
                onDateChanged: (date) => _selectDOBDate(context),
              ),
              const SizedBox(height: 40),
              InformationBox(todayDate: _todayDate, birthDate: _birthDate),
            ]
          ),
        ),
      ),
    );
  }
}


