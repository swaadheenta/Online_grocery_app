import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:Online_grocery_app/home.dart';
import 'package:Online_grocery_app/payment.dart';
import 'package:Online_grocery_app/uhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var user = FirebaseAuth.instance.currentUser.uid.toString();
  var i;
  var finalans = 0;

  var ans = 0;
  var total = 0;

  /* Future<void> getprice() async {
      print("getprice");
      QuerySnapshot q = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Details")
          .get();

      var a = q.docs[0];

    
        finalans = a["price"];
   




     

      

      print("finalans is $finalans");
    }*/

  @override
  Widget build(BuildContext context) {
    Future<void> displayinputdialogofconfirm(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Your order has been confirmed"),
              content: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Payment()));
                },
                child: Container(
                  width: displayWidth(context)*0.3,
                  height: displayHeight(context)*0.06,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      "Proceed to Payment",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: displayWidth(context) * 0.045),
                    ),
                  ),
                ),
              ),
            );
          });
    }

    Future<void> calculateprice() async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Products")
          .get();

      total = 0;
      for (int i = 0; i < querySnapshot.size; i++) {
        var a = querySnapshot.docs[i];
        // print(a["totalprice"]);

        total = total + a["totalprice"];
      }

      QuerySnapshot ds = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Details")
          .get();

      var s = ds.docs[0];
      var docname = s["name"];

      print(docname);
      print("total=$total");

      FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Details")
          .doc(docname)
          .update({"price": total});
    }

    /*Future<void> getprice() async {
      print("getprice");
      QuerySnapshot q = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Details")
          .get();

      var a = q.docs[0];

      finalans = a["price"];

      print("finalans is $finalans");
    }*/

    Widget finalprice(BuildContext context, doc) {
      ans = int.parse(doc['Newprice']) * doc['Itemcount'];
      String title = doc["Productname"];

      FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Products")
          .doc(title)
          .update({"totalprice": ans});
      calculateprice();
      //getprice();

      return Card(
        elevation: 10.0,
        child: Container(
          height: displayHeight(context) * 0.15,
          width: displayWidth(context) * 0.8,
          child: Row(
            children: [
              Container(
                height: displayHeight(context) * 0.125,
                width: displayWidth(context) * 0.25,
                child: Image.network(
                  doc["Image"],
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: displayWidth(context) * 0.1,
              ),
              Container(
                  width: displayWidth(context) * 0.35,
                  child: Text(doc['Productname'])),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Card(
                  elevation: 10.0,
                  child: Container(
                    width: displayWidth(context) * 0.15,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(ans.toString()),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Basket",
          style: TextStyle(fontSize: displayWidth(context) * 0.045),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              left: 0.0,
              child: Container(
                height: displayHeight(context),
                width: displayWidth(context),
                color: Colors.white,
              )),
          Positioned(
            top: displayHeight(context) * 0.015,
            child: Container(
              height: displayHeight(context) * 0.7,
              width: displayWidth(context),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Users")
                    .doc(user)
                    .collection("Products")
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return finalprice(context, snapshot.data.docs[index]);
                        });
                  } else {
                    return Text("Please check your internet connection!!");
                  }
                },
              ),
            ),
          ),
          Positioned(
              top: displayHeight(context) * 0.72,
              left: displayWidth(context) * 0.2,
              child: Container(
                  height: displayHeight(context) * 0.075,
                  width: displayWidth(context) * 0.6,
                  color: Colors.black54,
                  child:
                      /*Row(
                    children: [
                      SizedBox(
                        width: displayWidth(context) * 0.65,
                      ),*/
                      /* SizedBox(
                        width: displayWidth(context) * 0.55,
                        child: Text(
                          "Price : $finalans",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),*/
                      RaisedButton(
                          color: Colors.green,
                          child: Text(
                            "Confirm Order",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: displayWidth(context) * 0.045),
                          ),
                          onPressed: () {
                            displayinputdialogofconfirm(context);
                          })
                  // ],
                  ))
          //),
        ],
      ),
    );
  }
}
