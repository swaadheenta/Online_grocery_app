import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  var user = FirebaseAuth.instance.currentUser.uid.toString();
  var i, finalans;

  var ans = 0;
  var total = 0;

  @override
  Widget build(BuildContext context) {
    

    Future<void> getprice() async {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Users")
          .doc(user)
          .collection("Products")
          .get();

      total = 0;
      for (int i = 0; i < querySnapshot.size; i++) {
        var a = querySnapshot.docs[i];
        setState(() {
          total = total + a["totalprice"];
        });
        
      }

      print("total=$total");
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
     getprice();
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
          title: Text("Your Basket",style: TextStyle(fontSize: displayWidth(context)*0.045),),
          /*leading: IconButton(
            onPressed:()
            {
              Navigator.pop(context);
            } ,
            icon: Icon(Icons.arrow_back_ios),iconSize: displayWidth(context)*0.045,),*/
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
              child: Container(
                height: displayHeight(context) * 0.08,
                width: displayWidth(context),
                color: Colors.grey,
                child: Center(
                    child: Text(
                  "Price : $total",
                  style: TextStyle(color: Colors.white),
                )),
              ))
        ],
      ),
    );
  }
}
