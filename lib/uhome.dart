import 'package:Online_grocery_app/All%20Categories/appliances.dart';
import 'package:Online_grocery_app/All%20Categories/b&h.dart';
import 'package:Online_grocery_app/All%20Categories/baby.dart';
import 'package:Online_grocery_app/All%20Categories/bak&dar.dart';
import 'package:Online_grocery_app/All%20Categories/drinks.dart';
import 'package:Online_grocery_app/All%20Categories/f&v.dart';
import 'package:Online_grocery_app/All%20Categories/household.dart';
import 'package:Online_grocery_app/All%20Categories/masala.dart';
import 'package:Online_grocery_app/All%20Categories/sn&C.dart';
import 'package:Online_grocery_app/Authentication/firstscreen.dart';
import 'package:Online_grocery_app/Cart.dart';
import 'package:Online_grocery_app/Category/BabyCare/Food.dart';
import 'package:Online_grocery_app/Category/Foodgrains/Oils.dart';
import 'package:Online_grocery_app/Category/Health/health.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ushome extends StatefulWidget {
  ushome({Key key}) : super(key: key);

  @override
  _ushomeState createState() => _ushomeState();
}

class _ushomeState extends State<ushome> {
  @override
  Widget build(BuildContext context) {
    /*Widget _imagecarousel = Container(
      height: displayHeight(context) * 0.25,
      width: displayWidth(context),
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage("images/of1.jpg"),
          AssetImage("images/offer2.jpg"),
          AssetImage("images/offer3.jpg"),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 1.5,
      ),
    );*/
    return Scaffold(
      
      // backgroundColor: Color(0xffb192734),
   //  backgroundColor: Color(0xffb24a0ed),
       //backgroundColor: Color(0xffb3f729b),
        appBar: AppBar(
          backgroundColor: Color(0xffb192734),
          title: Text(
            "Hi there",
            style: TextStyle(
                fontFamily: "Breeserif",
                color: Colors.white,
                fontSize: displayWidth(context) * 0.04),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => first()));
                })
          ],
        ),
        body: ListView(
          
          children: [
            Container(
              height: displayHeight(context) * 0.25,
              width: displayWidth(context),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthDrinks()));
                    },
                    child: Container(
                      height: displayHeight(context) * 0.25,
                      width: displayWidth(context),
                      child: Image(
                        image: AssetImage(
                          "images/offer1.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => dairy()));
                    },
                    child: Container(
                      height: displayHeight(context) * 0.25,
                      width: displayWidth(context),
                      child: Image(
                        image: AssetImage(
                          "images/off2.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Oils()));
                    },
                    child: Container(
                      height: displayHeight(context) * 0.25,
                      width: displayWidth(context),
                      child: Image(
                        image: AssetImage(
                          "images/offer3.jpg",
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Opacity(
              opacity: 0.0,
              child: Divider(
                height: displayHeight(context) * 0.025,
              ),
            ),
            Center(
              child: Text(
                "Shop by Category",
                style: TextStyle(
                  fontFamily: "Langar",
                  color: Colors.black,
                  fontSize: displayWidth(context) * 0.065,
                  //letterSpacing: displayWidth(context)*0.001
                  wordSpacing: displayWidth(context) * 0.025,
                ),
              ),
            ),
            Opacity(opacity: 0.0, child: Divider()),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
              child: Table(
                  defaultColumnWidth:
                      FixedColumnWidth(displayWidth(context) * 0.3),
                  border: TableBorder.all(),
                  children: [
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => drinks()));
                        },
                        child: Container(
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
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Health Drinks & Beverages",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => appliances()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Kitchen Appliances",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => masala()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Foodgrains , Oils & Masala",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => household()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Cleaning  and Household",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => confectionery()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Snacks and Confectionery",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => dairy()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Bakery & Dairy",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => fnv()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Fruits and Vegetables",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => bnh()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Beauty and Hygiene",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => baby()));
                        },
                        child: Container(
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
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 2.0),
                              child: Text(
                                "Baby care",
                                 style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ]),
                  ]),
            ),
          ],
        )

        /*SingleChildScrollView(
        child: Column(
          children: [
             Divider(
              height: displayHeight(context) * 0.02,
            ),
            _imagecarousel,
            Divider(
              height: displayHeight(context) * 0.3,
            ),
            Text(
              "Shop by Category",
              style: TextStyle(
                fontFamily: "Langar",
                fontSize: displayWidth(context) * 0.065,
                //letterSpacing: displayWidth(context)*0.001
                wordSpacing: displayWidth(context) * 0.025,
              ),
            ),
            Divider(),
            Table(
                defaultColumnWidth:
                    FixedColumnWidth(displayWidth(context) * 0.3),
                border: TableBorder.all(),
                children: [
                  TableRow(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => drinks()));
                      },
                      child: Container(
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
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Health Drinks & Beverages",
                            ),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => appliances()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Kitchen Appliances",
                            ),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => masala()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Foodgrains , Oils & Masala",
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => household()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Cleaning  and Household",
                            ),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => confectionery()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Snacks and Confectionery",
                            ),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => dairy()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Bakery & Dairy",
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ]),
                  TableRow(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => fnv()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Fruits and Vegetables",
                            ),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => bnh()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Beauty and Hygiene",
                            ),
                          ),
                        ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => baby()));
                      },
                      child: Container(
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
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 2.0),
                            child: Text(
                              "Baby care",
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ]),
                ]),
            Divider(),
          ],
        ),
      ),*/

        /*Positioned(
          top: displayHeight(context) * 0.18,
          left: displayWidth(context) * 0.05,
          right: displayWidth(context) * 0.05,
          child:  
                         
                          
                         ),*/

        //),
        );
  }
}
