import 'package:flutter/material.dart';
import 'package:reminder/view/widget/remind_me.dart';
import 'package:reminder/view/widget/reminder.dart';

class Home extends StatelessWidget {
  static const String id = 'home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Text('Reminder'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context,Reminder.id);
              },
              icon: Icon(Icons.add_circle,color: Colors.red,),
            ),
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            RemindMe(),
          ],
        )
    )
    );
  }
}
