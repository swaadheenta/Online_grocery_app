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

  @override
  Widget build(BuildContext context) {
    Future<void> displayinputdialogofconfirm(BuildContext context) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Color(0xffb192734),
              title: Text("Your order has been confirmed",
              style: TextStyle(color: Colors.white),
              ),
              content: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Payment()));
                
                },
                child: Container(
                  width: displayWidth(context) * 0.1,
                  height: displayHeight(context) * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xffb20d666),
                  ),
                    
                  child: Center(
                    child: Text(
                      "Proceed to Payment",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                          fontSize: displayWidth(context) * 0.046),
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
      //backgroundColor: Color(0xffb197324),
      appBar: AppBar(
        // backgroundColor: Color(0xffbc27bb9),
         backgroundColor: Color(0xffb192734),
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
              height: displayHeight(context) * 0.675,
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
              top: displayHeight(context) * 0.7,
              left: displayWidth(context) * 0.25,
              child: GestureDetector(
                onTap: ()
                {
                  displayinputdialogofconfirm(context);
                },
                              child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                       color: Colors.deepOrange,
                    ),
                      height: displayHeight(context) * 0.055,
                      width: displayWidth(context) * 0.5,
                    //  color: Colors.black54,
                      
                         //color: Colors.deepOrange,
                          child: Center(
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: displayWidth(context) * 0.045),
                            ),
                          ),
                         )),
              ),
              )
        ],
      ),
    );
  }
}
