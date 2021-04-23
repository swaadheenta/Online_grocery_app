import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Shoppinglist extends StatefulWidget {
  Shoppinglist({Key key}) : super(key: key);

  @override
  _ShoppinglistState createState() => _ShoppinglistState();
}

class _ShoppinglistState extends State<Shoppinglist> {
  String currentuserid;
  String currentuser;
  var cnt;
  var username;
  int price = 0;
  int ans = 0;
  int finalprice;
  String docname;

  Future<String> getcurrentuser() async {
    var user = FirebaseAuth.instance.currentUser.uid;
    currentuserid = user.toString();
    

    var ds = await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentuserid)
        .collection("Products")
        .get();
   

    return currentuser;
  }

  
  @override
  Widget build(BuildContext context) {
    print("Current usser is");
    print(getcurrentuser());

    Widget _itemsofShoppinglist(BuildContext context, DocumentSnapshot doc) {
      var count;
   
      price = price + ans;
      print("price=$price");
     
      String title = doc["Productname"];
    
      return GestureDetector(
        onTap: () {
          
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
                    width: displayWidth(context) * 0.38,
                    fit: BoxFit.fill,
                  ),
                  footer: GridTileBar(
                    // title: Text(doc["Productname"]),
                    backgroundColor: Colors.black38,
                    // leading: doc["Productname"],
                    leading: new Row(children: <Widget>[
                      doc["Itemcount"] != 0
                          ? new IconButton(
                              icon: new Icon(Icons.remove),
                              onPressed: () => setState(() {
                              ////  price -= int.parse(doc['Newprice']) *
                                    doc['Itemcount'];
                                count = doc["Itemcount"] - 1;
                                //ans -= int.parse(doc["Newprice"]);
                               // print("newans is$ans");
                                //  print(Price);
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
                        style: TextStyle(color: Colors.white),
                      ),
                      new IconButton(
                        icon: new Icon(Icons.add),
                        onPressed: () => setState(() {
                          // price-=
                           //   int.parse(doc['Newprice']) * doc['Itemcount'];
                          cnt = doc["Itemcount"] + 1;
                          //  ans += int.parse(doc["Newprice"]);
                          print("newans is$ans");
                          // print(price);
                          FirebaseFirestore.instance
                              .collection("Users")
                              .doc(currentuserid)
                              .collection("Products")
                              .doc(title)
                              .update({"Itemcount": cnt});
                        }),
                      ),
                    ]),
                  ))),
        ),
      );
    }

    ;

  
    return Scaffold(
      appBar: AppBar(
          title: Text("Shopping List",style: TextStyle(fontSize: displayWidth(context)*0.045),),
          /*leading: IconButton(
            onPressed:()
            {
              Navigator.pop(context);
            } ,
            icon: Icon(Icons.arrow_back_ios),iconSize: displayWidth(context)*0.045,),*/
            centerTitle: true,
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
                            return _itemsofShoppinglist(
                                context, snapshot.data.docs[index]);
                          });
                    } else {
                      return Text("Please check your internet connection!!");
                    }
                  },
                ),
              )),
      
        ],
      ),
    );
  }
}
