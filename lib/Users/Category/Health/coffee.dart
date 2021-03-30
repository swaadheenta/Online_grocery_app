import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class singlecard {
  String title;
  bool isselected;
  singlecard({this.title, this.isselected});
}

class Cof extends StatefulWidget {
  @override
  _CofState createState() => _CofState();
}

class _CofState extends State<Cof> {
  bool isselected;
  Color color = Colors.red[100];

  List<singlecard> coflist = [
    singlecard(
      title: "Instant Coffee",
      isselected: true,
    ),
    singlecard(
      title: "Ground Coffee",
      isselected: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    Widget _showcard(int index) {
      return GestureDetector(
          onTap: () {
            setState(() {
              if (coflist[index].isselected) {
                //
              } else {
                coflist[index].isselected = true;
                print(coflist[index].isselected);

                for (int i = 0; i < coflist.length; i++) {
                  if (i != index) {
                    coflist[i].isselected = false;
                  }
                }
              }
            });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                coflist[index].title,
                style: TextStyle(
                    color: coflist[index].isselected
                        ? Colors.redAccent
                        : Colors.black,fontFamily: "BreeSerif",
                        fontSize: displayWidth(context)*0.045),
              ),
            ),
          ));
    }

    ;

    return Scaffold(
        appBar: AppBar(
          title: Text("Coffee"),
        ),
        body: Stack(
          children: [
            Positioned(
              
              child: Container(
                height: displayHeight(context) * 0.07,
                color: Colors.grey,
                child: ListView.builder(
                    itemCount: coflist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return _showcard(index);
                    }),
              
              ),
            )
          ],
        ));
  }
}
