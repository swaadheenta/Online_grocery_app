import 'package:Online_grocery_app/Cart.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class singlecard {
  String title;
  bool isselected;
  singlecard({this.title, this.isselected});
}

class fnv extends StatefulWidget {
  @override
  _fnvState createState() => _fnvState();
}

class _fnvState extends State<fnv> {
  bool isselected;
  Color color = Colors.red[100];

  List<singlecard> fnvlist = [
    singlecard(
      title: "Potato, Onion & Tomato",
      isselected: true,
    ),
    singlecard(
      title: "Ladyfinger, Drumstick & Cauliflower",
      isselected: false,
    ),
    singlecard(
      title: "Leafy Vegetables",
      isselected: false,
    ),
     singlecard(
      title: "Apples,Banana & Pomegranate",
      isselected: false,
    ),
     singlecard(
      title: "Melon, Papaya & Citrus Fruits",
      isselected: false,
    ),
   
  ];
  var category = "Potato, Onion & Tomato";
  @override
  Widget build(BuildContext context) {
    Widget _showcard(int index) {
      return GestureDetector(
          onTap: () {
            setState(() {
              category = fnvlist[index].title;
              if (fnvlist[index].isselected) {
                //
              } else {
                fnvlist[index].isselected = true;
                print(fnvlist[index].isselected);

                for (int i = 0; i < fnvlist.length; i++) {
                  if (i != index) {
                    fnvlist[i].isselected = false;
                  }
                }
              }
            });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                fnvlist[index].title,
                style: TextStyle(
                    color: fnvlist[index].isselected
                        ? Colors.redAccent
                        : Colors.black,
                    fontFamily: "BreeSerif",
                    fontSize: displayWidth(context) * 0.0375),
              ),
            ),
          ));
    }

    ;
   Widget _showlist(BuildContext context, DocumentSnapshot doc) {
      String oldprice = doc['oldprice'];
      String newprice = doc['newprice'];
      String productname = doc['name'];
      String quantity = doc['quantity'];
      String image = doc['imgloc'];
      var height = displayHeight(context) * 0.1;
      return Stack(
        children: [
          Positioned(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 2.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 10.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  //color: Colors.red,
                  height: displayHeight(context) * 0.25,
                  width: displayWidth(context) * 0.95,
                ),
              ),
            ),
          ),
          Positioned(
            left: displayWidth(context) * 0.05,
            top: displayHeight(context) * 0.02,
            child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                height: displayHeight(context) * 0.18,
                width: displayWidth(context) * 0.38,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    //color: Colors.yellow,
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 8.0, right: 8.0),
                  child: Container(
                    height: displayHeight(context) * 0.16,
                    width: displayWidth(context) * 0.36,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      //border: Border.all(color: Colors.black)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 2.0, left: 2.0, top: 20.0),
                      child: Image.network(
                        doc['imgloc'],
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: displayWidth(context) * 0.495,
              top: displayHeight(context) * 0.04,
              child: Container(
                  child: Column(
                children: [
                  Divider(
                    height: displayHeight(context) * 0.02,
                  ),
                  Text(
                    doc['name'],
                    style: TextStyle(
                        fontFamily: "BreeSerif",
                        fontSize: displayWidth(context) * 0.04,
                        fontWeight: FontWeight.w400
                        ),
                  ),
                  Divider(
                    height: displayHeight(context) * 0.01,
                  ),
                  Text(
                    "quantity: $quantity",
                    style: TextStyle(
                     // fontFamily: "Langar",
                      letterSpacing: displayWidth(context) * 0.002,
                      fontSize: displayWidth(context) * 0.04,
                    ),
                  ),
                  Divider(
                    height: displayHeight(context) * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        "₹ $oldprice",
                        style: TextStyle(
                        //  fontFamily: "Langar",
                          letterSpacing: displayWidth(context) * 0.002,
                          fontSize: displayWidth(context) * 0.04,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        "  ₹ $newprice",
                        style: TextStyle(
                       //   fontFamily: "Langar",
                          letterSpacing: displayWidth(context) * 0.002,
                          fontSize: displayWidth(context) * 0.04,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text(
                    " ",
                    style: TextStyle(
                       // fontFamily: "BreeSerif",
                        fontSize: displayWidth(context) * 0.045,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    height: displayHeight(context) * 0.035,
                  ),
                ],
              ))),
          Positioned(
              bottom: displayHeight(context) * 0.045,
              right: displayWidth(context) * 0.05,
              child: GestureDetector(
                  onTap: () {
                    SnackBar snackbar = SnackBar(
                        content: Text(
                            "$productname added successfully !!"));
                    Scaffold.of(context).showSnackBar(snackbar);
                    addtofirebase(productname, image, oldprice, newprice, 1,0);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.redAccent,
                      ),
                      height: displayHeight(context) * 0.05,
                      width: displayWidth(context) * 0.3,
                      child: Center(
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "BreeSerif"),
                        ),
                      ))))
        ],
      );
    }

    ;


    return Scaffold(
        appBar: AppBar(
          title: Text("Fruits & Vegetables",style: TextStyle(fontSize: displayWidth(context)*0.045),),
          leading: IconButton(
            onPressed:()
            {
              Navigator.pop(context);
            } ,
            icon: Icon(Icons.arrow_back_ios),iconSize: displayWidth(context)*0.045,),
             actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                })
          ],
        ),
        body: Stack(
          children: [
            Positioned(
                child: Container(
              height: displayHeight(context),
              width: displayWidth(context),
            )),
            Positioned(
              child: Container(
                height: displayHeight(context) * 0.07,
                color: Colors.grey[300],
                child: ListView.builder(
                    itemCount: fnvlist.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return _showcard(index);
                    }),
              ),
            ),
            Positioned(
                top: displayHeight(context) * 0.1,
                left: displayWidth(context) * 0.025,
                child: Container(
                    height: displayHeight(context) * 0.75,
                    width: displayWidth(context) * 0.95,
                    // color: Colors.yellow,
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection(category)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _showlist(
                                    context, snapshot.data.docs[index]);
                              });
                        }
                      },
                    )))
          ],
        ));
  }
}

Future<void> getdatafromfirebase() async {
  var docname = FirebaseAuth.instance.currentUser.uid;
  DocumentSnapshot variable = await FirebaseFirestore.instance
      .collection('Users')
      .doc(docname.toString())
      .get();
  print(variable["name"]);
}

Future<void> addtofirebase(String productname, String image, String oldprice,
    String newprice, int itemcount,int totalprice) async {
  var docname = FirebaseAuth.instance.currentUser.uid;
  FirebaseFirestore.instance
      .collection("Users")
      .doc(docname)
      .collection("Products")
      .doc(productname)
      .set({
    "Productname": productname,
    "Image": image,
    "Oldprice": oldprice,
    "Newprice": newprice,
    "Itemcount": itemcount,
    "totalprice":totalprice,
  });
}

