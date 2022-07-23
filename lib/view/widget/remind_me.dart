import 'package:flutter/material.dart';
class RemindMe extends StatelessWidget {
  const RemindMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 1.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 10  horizontally
                1.0, // Move to bottom 5 Vertically
              ),
            ),
          ],
        ),
        width: double.infinity,
        height: 80.0,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    'Create   BOQ',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
                  ),
                  Row(
                    children: [
                      Text('feb 17'),
                      Text('12.30 PM'),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 160.0,),
              IconButton(onPressed: (){

              }, icon: Icon(Icons.more_vert),)
            ],
          ),
        ),
      ),
    );
  }
}
