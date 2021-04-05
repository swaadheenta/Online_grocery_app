import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class info {
  String name;
  String surname;
  info({this.name, this.surname}); //Initialisation !!
}

class demo extends StatefulWidget {
  @override
  _demoState createState() => _demoState();
}

class _demoState extends State<demo> {
  List<info> demoloist = [
    info(
      name: "Harshali",
      surname: "Pachchigar",
    ),
    info(
      name: "Gayatri",
      surname: "Agnani",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget _card(int index) {
      return Card(
        child: Text(demoloist[index].name),
      );
    }

 Widget _Categorylist(int index)
 {
   return Container(
     height: displayHeight(context)*0.3,
     width: displayWidth(context)*0.95,
     color: Colors.blue,
     child: Column(
       children: [
         Container(
           height: displayHeight(context)*0.2,
           width: displayWidth(context)*0.3,
           
         )
       ],
     ),
   );
 }

    return Scaffold(
      body: ListView.builder(
          itemCount: demoloist.length,
          itemBuilder: (BuildContext context, int index) {
            return _card(index);
          }),
    );
  }
}
