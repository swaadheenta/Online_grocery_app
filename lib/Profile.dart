import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  profile({Key key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String name = "";
  // String email = "";
  String phoneno = "";
 
  String address = "";
  String delivery = "";
  //String weight = "";

  Future<String> getpersonalinfo() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docname)
        .get();
    setState(() {
      name = ds["name"];
     
      phoneno = ds["phoneno"];
    
      address = ds["address"];
      if (ds["pending"] == true)
        delivery = "Not yet delivered";
      else
        delivery = "Delivered !!";
    });

    return "yes";
  }

  Future addnametofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid;
    print(docname);
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docname)
        .update({"name": name, "hello": "world"});
  }

  Future addphonenotofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docname)
        .update({"phoneno": phoneno});
  }

  Future addaddresstofirebase() async {
    var docname = FirebaseAuth.instance.currentUser.uid;
    await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docname)
        .update({"address": address});
  }

  
  Future<void> _displayTextInputDialogofname(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your name'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //   codeDialog = valueText;
                      name = valueText;
                    });
                    Navigator.pop(context);
                    addnametofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogofphoneno(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your phoneno'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //  codeDialog = valueText;
                      phoneno = valueText;
                    });
                    Navigator.pop(context);
                    addphonenotofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> _displayTextInputDialogofaddress(BuildContext context) async {
    String codeDialog;
    String valueText;

    TextEditingController _textFieldController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter your address'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              //decoration: InputDecoration(hintText: "Text Field in Dialog"),
            ),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      //  codeDialog = valueText;
                      address = valueText;
                    });
                    Navigator.pop(context);
                    addaddresstofirebase();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  
  Future<String> getdeliverystatus() async {
    var docname = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docname)
        .get();

    bool ans = ds["pending"];
    if (ans == true) {
      return "Not yet delivered";
    } else
      return "Delivered";
  }

  @override
  Widget build(BuildContext context) {
    getpersonalinfo();
    return Scaffold(
      body: 
      Stack(alignment: Alignment.center, children: [
        Positioned(
          child: Container(
            height: displayHeight(context),
            width: displayWidth(context),
          ),
        ),
        
        Positioned(
          top: 0.0,
          child: Container(
            color:   Color(0xffb192734),
            height: displayHeight(context) * 0.35,
            width: displayWidth(context),
          ),
        ),
       
        Positioned(
            top: displayHeight(context) * 0.1,
            child: Column(children: [
              Icon(
                Icons.account_circle,
                size: displayWidth(context) * 0.25,
                color: Colors.white,
              ),
              Divider(),
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: displayWidth(context) * 0.04),
              ),
            
            ])),
        Positioned(
          top: displayHeight(context) * 0.38,
          child: Container(
            height: displayHeight(context) * 0.525,
            width: displayWidth(context),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Card displaying name !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Name :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              name,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                       ]),
                    ),
                  ),
                  Divider(),
                  //Card displaying phoneno !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Phoneno :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              phoneno,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        
                      ]),
                    ),
                  ),
                  Divider(),
                  //Card displaying address !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Address :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              address,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                       
                      ]),
                    ),
                  ),
                  Divider(),
                  //Card displaying gender !!
                 

                  //card displaying confirmation status !!
                  Card(
                    elevation: 10.0,
                    child: Container(
                      height: displayHeight(context) * 0.135,
                      width: displayWidth(context) * 0.9,
                      child: Stack(children: [
                        Positioned(
                            left: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              "Order Status :",
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                        Positioned(
                            right: displayWidth(context) * 0.05,
                            top: displayHeight(context) * 0.025,
                            child: Text(
                              delivery,
                              style: TextStyle(
                                  fontSize: displayWidth(context) * 0.045),
                            )),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
