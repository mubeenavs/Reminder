import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Reminder extends StatefulWidget {
  static const String id = 'reminder';
  @override
  State<StatefulWidget> createState() {
    return _Reminder();
  }
}

class _Reminder extends State<Reminder> {
  TextEditingController dateinput =
      TextEditingController(); //text editing controller for text field
  TextEditingController timeinput =
      TextEditingController(); //text editing controller for text field

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    timeinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Set a Reminder"),
          backgroundColor: Colors.white, //background color of app bar
          foregroundColor: Colors.black,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 15, right: 15,top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Alert Text',
                  hintText: 'Alert Text',
                ),
              ),
              SizedBox(height: 8,),
              TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today),
                labelText: "Enter Date", //label text of field
                border: OutlineInputBorder(),
                  ),
                  readOnly:
                  true, //set it true, so that user will not able to edit text
                  onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
                  },
                ),
              SizedBox(height: 8.0,),
              TextField(
                controller: timeinput, //editing controller of this TextField
                decoration: InputDecoration(
              labelText: "Enter Time", //label text of field
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.timer),
                ),
                readOnly:
                true, //set it true, so that user will not able to edit text
                onTap: () async {
              TimeOfDay? pickedTime = await showTimePicker(
                initialTime: TimeOfDay.now(),
                context: context,
              );

              if (pickedTime != null) {
                print(pickedTime.format(context)); //output 10:51 PM
                DateTime parsedTime = DateFormat.jm()
                    .parse(pickedTime.format(context).toString());
                //converting to DateTime so that we can further format on different pattern.
                print(parsedTime); //output 1970-01-01 22:53:00.000
                String formattedTime =
                    DateFormat('HH:mm:ss').format(parsedTime);
                print(formattedTime); //output 14:59:00
                //DateFormat() is from intl package, you can format the time on any pattern you need.

                setState(() {
                  timeinput.text =
                      formattedTime; //set the value of text field.
                });
              } else {
                print("Time is not selected");
              }
                },
              ),
              SizedBox(height: 8.0,),
              Material(
                elevation: 5.0,
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(8.0),
                child: MaterialButton(
                  onPressed: () {
                  },
                  height: 42.0,
                  child: Text(
                    'Add Alert',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
// Output Screenshots:
