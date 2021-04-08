import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  String currentuserid;
  String currentuser;

  Future<String> getcurrentuser() async {
    var user = FirebaseAuth.instance.currentUser.uid;
    currentuserid = user.toString();
    print(currentuserid);
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentuser)
        .get();
    currentuser = ds["name"];
    return user;
    // DocumentSnapshot ds=FirebaseFirestore.instance.collection("Users").doc(user.toString()).collection("Products").doc();
  }

  @override
  Widget build(BuildContext context) {
    getcurrentuser();
    Widget _itemsofcart(BuildContext context, DocumentSnapshot doc) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            height: displayHeight(context) * 0.2,
            width: displayWidth(context) * 0.36,
            child: Image.network(
              doc["Image"],
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            height: displayHeight(context) * 0.8,
            width: displayWidth(context),
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("Users")
                  .doc(currentuserid)
                  .collection("Products")
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                      itemCount: snapshot.data.docs.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: displayWidth(context) * 0.2,
                        crossAxisSpacing: displayWidth(context) * 0.1,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return _itemsofcart(context, snapshot.data.docs[index]);
                      });
                }
              },
            ),
          ))
        ],
      ),
    );
  }
}
