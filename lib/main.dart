import 'package:flutter/material.dart';
import 'package:reminder/view/home.dart';
import 'package:reminder/view/widget/reminder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReminderBloc(),
      child: MaterialApp(
            initialRoute: Home.id,
            routes: {
              Home.id: (context) => Home(),
              Reminder.id:(context) => Reminder(),
            }
        ),
    );
  }
}

