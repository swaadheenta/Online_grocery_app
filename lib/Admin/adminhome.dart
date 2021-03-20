
import 'package:Online_grocery_app/Admin/Health/Healthdrinks.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';


class adminhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a category"),
      ),
        body: Stack(
      children: [
        Positioned(
            child: Container(
          height: displayHeight(context),
          width: displayWidth(context),
        )),
       
        Positioned(
          top: displayHeight(context) * 0.05,
          left: displayWidth(context) * 0.02,
          child: Container(
            height: displayHeight(context) * 0.8,
            child: SingleChildScrollView(
              child: Column(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Health()));
                  },
                  child: Container(
                      height: displayHeight(context) * 0.12,
                      width: displayWidth(context) * 0.96,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10.0,
                        child: Stack(alignment: Alignment.center, children: [
                          Positioned(
                              left: displayWidth(context) * 0.02,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset("images/img1.jpg"),
                                radius: displayWidth(context) * 0.1,
                              )),
                          Positioned(
                              left: displayWidth(context) * 0.35,
                              child: Text(
                                "Health Drinks & Beverages",
                                style: TextStyle(
                                    fontFamily: "Breeserif",
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8),
                              )),
                        ]),
                      )),
                ),
                Divider(
                  height: displayHeight(context)*0.005,
                ),
                GestureDetector(
                  child: Container(
                      height: displayHeight(context) * 0.12,
                      width: displayWidth(context) * 0.96,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        elevation: 10.0,
                        child: Stack(alignment: Alignment.center, children: [
                          Positioned(
                              left: displayWidth(context) * 0.02,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset("images/img2.jpg"),
                                radius:displayWidth(context)*0.1,
                              )),
                          Positioned(
                              left: displayWidth(context) * 0.35,
                              child: Text(
                                "Instant & Ready Foods",
                                style: TextStyle(
                                  fontFamily: "Breeserif",
                                  fontSize: displayWidth(context) * 0.04,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.8,
                                ),
                              )),
                        ]),
                      )),
                ),
                Divider(
                  height:displayHeight(context)*0.005,
                ),
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img3.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text(
                              "Foodgrains, Oils & Masala",
                              style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            )),
                      ]),
                    )),
               Divider( height:displayHeight(context)*0.005,),
              
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img4.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text(
                              "Cleaning & Household",
                              style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            )),
                      ]),
                    )),
               
              Divider( height:displayHeight(context)*0.005,),
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img5.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text("Snacks & Confectionery",
                                style: TextStyle(
                                    fontFamily: "BreeSerif",
                                    fontSize: displayWidth(context) * 0.04,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.8))),
                      ]),
                    )),
               
                Divider( height:displayHeight(context)*0.005,),
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img6.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text(
                              "Bakery & Dairy",
                              style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            )),
                      ]),
                    )),
               
               Divider( height:displayHeight(context)*0.005,),
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img7.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text(
                              "Fruits & Vegetables",
                              style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            )),
                      ]),
                    )),
               
               Divider( height:displayHeight(context)*0.005,),
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img8.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text(
                              "Beauty & Hygiene",
                              style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            )),
                      ]),
                    )),
               
             Divider( height:displayHeight(context)*0.005,),
                Container(
                    height: displayHeight(context) * 0.12,
                    width: displayWidth(context) * 0.96,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 10.0,
                      child: Stack(alignment: Alignment.center, children: [
                        Positioned(
                            left: displayWidth(context) * 0.02,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("images/img9.jpg"),
                              radius:displayWidth(context)*0.1,
                            )),
                        Positioned(
                            left: displayWidth(context) * 0.35,
                            child: Text(
                              "Baby Care",
                              style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.04,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                              ),
                            )),
                      ]),
                    )),
              ]),
            ),
          ),
        )
      ],
    ));
  }
}
