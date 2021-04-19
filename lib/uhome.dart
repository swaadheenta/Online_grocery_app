import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class ushome extends StatefulWidget {
  ushome({Key key}) : super(key: key);

  @override
  _ushomeState createState() => _ushomeState();
}

class _ushomeState extends State<ushome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hi there",
          style: TextStyle(
              fontFamily: "Breeserif", fontSize: displayWidth(context) * 0.04),
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        Positioned(
            top: displayHeight(context) * 0.05,
            left: displayWidth(context) * 0.05,
            child: Text(
              "Shop by Category",
              style: TextStyle(
                fontFamily: "Langar",
                fontSize: displayWidth(context) * 0.065,
                //letterSpacing: displayWidth(context)*0.001
                wordSpacing: displayWidth(context) * 0.025,
              ),
            )),
        Positioned(
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.05,
          child: Container(
              child: Table(
                  defaultColumnWidth:
                      FixedColumnWidth(displayWidth(context) * 0.3),
                  border: TableBorder.all(),
                  children: [
                TableRow(children: [
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img1.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      //Flexible(child: Text("Health Drinks & Beverages",)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Health Drinks & Beverages",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img14.jpeg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Instant & Ready Foods",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img3.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Foodgrains , Oils & Masala",
                        ),
                      ),
                    ]),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img4.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Cleaning  and Household",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img5.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Snacks and Confectionery",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img6.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Bakery & Dairy",
                        ),
                      ),
                    ]),
                  ),
                ]),
                TableRow(children: [
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img7.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Fruits and Vegetables",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img8.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Beauty and Hygiene",
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: displayHeight(context) * 0.2,
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height: displayHeight(context) * 0.1,
                          color: Colors.blue,
                          child: Image(
                            image: AssetImage(
                              "images/img9.jpg",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Divider(
                        height: displayHeight(context) * 0.007,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 2.0),
                        child: Text(
                          "Baby care",
                        ),
                      ),
                    ]),
                  ),
                ]),
              ])),
        ),
      ]),
    );
  }
}
