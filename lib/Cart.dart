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
  var cnt;

  Future<String> getcurrentuser() async {
    var user = FirebaseAuth.instance.currentUser.uid;
    currentuserid = user.toString();
    //print(currentuserid);
    var q = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentuserid)
        .collection("Details")
        .get();
    //currentuser = ds["name"];
    //print(currentuser);

    return currentuser;
  }

  @override
  Widget build(BuildContext context) {
    print("Current usser is");
    print(getcurrentuser());

    Widget _itemsofcart(BuildContext context, DocumentSnapshot doc) {
      var count;

      String title = doc["Productname"];
      print(title);
      return GestureDetector(
        onTap: () {
          print(getcurrentuser());
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: GridTile(
                //header: Text(title),
                child: Image.network(
                  doc["Image"],
                  height: displayHeight(context) * 0.2,
                  width: displayWidth(context) * 0.35,
                  fit: BoxFit.fill,
                ),
                footer: GridTileBar(
                  title: Text(doc["Productname"]),
                  backgroundColor: Colors.grey,
                  //leading: doc["Productname"],
                  trailing: new Row(children: <Widget>[
                    doc["Itemcount"] != 0
                        ? new IconButton(
                            icon: new Icon(Icons.remove),
                            onPressed: () => setState(() {
                              count = doc["Itemcount"] - 1;

                              FirebaseFirestore.instance
                                  .collection("Users")
                                  .doc(currentuserid)
                                  .collection("Products")
                                  .doc(title)
                                  .update({"Itemcount": count});
                            }),
                          )
                        : FirebaseFirestore.instance
                            .collection("Users")
                            .doc(currentuserid)
                            .collection("Products")
                            .doc(title)
                            .delete(),
                    new Text(
                      doc["Itemcount"].toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                    new IconButton(
                      icon: new Icon(Icons.add),
                      onPressed: () => setState(() {
                        cnt = doc["Itemcount"] + 1;
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(currentuserid)
                            .collection("Products")
                            .doc(title)
                            .update({"Itemcount": cnt});
                      }),
                    ),
                  ]),
                )),
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
            height: displayHeight(context),
            width: displayWidth(context),
            //color: Colors.amber,
          )),
          Positioned(
              top: displayHeight(context) * 0.02,
              left: displayWidth(context) * 0.04,
              child: Container(
                height: displayHeight(context) * 0.77,
                width: displayWidth(context) * 0.9,
                // color: Colors.yellow,
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: displayWidth(context) * 0.02,
                            crossAxisSpacing: displayWidth(context) * 0.06,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return _itemsofcart(
                                context, snapshot.data.docs[index]);
                          });
                    } else {
                      return Text("Please check your internet connection!!");
                    }
                  },
                ),
              ))
        ],
      ),
    );
  }
}
