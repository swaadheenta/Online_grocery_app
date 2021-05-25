import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class editadd extends StatefulWidget {
  editadd({Key key}) : super(key: key);

  @override
  _editaddState createState() => _editaddState();
}

class _editaddState extends State<editadd> {
  String phoneno = "";
  String name = "";
  String address = "";

  Future<String> getpersonalinfo() async {
    var docname = FirebaseAuth.instance.currentUser.uid.toString();
    DocumentSnapshot ds = await FirebaseFirestore.instance
        .collection("Orders")
        .doc(docname)
        .get();
    setState(() {
      phoneno = ds["phoneno"];
      name = ds["name"];

      address = ds["address"];
    });

    return "yes";
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

  @override
  Widget build(BuildContext context) {
    getpersonalinfo();
    return Scaffold(
        
        body: Stack(alignment: Alignment.center, children: [
          Positioned(
            child: Container(
              height: displayHeight(context),
              width: displayWidth(context),
            ),
          ),
          Positioned(
            top: 0.0,
            child: Container(
              color: Colors.blue,
              height: displayHeight(context) * 0.3,
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
              top: displayHeight(context) * 0.035,
              left: displayWidth(context)*0.01,
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  })),
          Positioned(
              top: displayHeight(context) * 0.35,
              child: Container(
                  height: displayHeight(context) * 0.525,
                  width: displayWidth(context),
                  child: SingleChildScrollView(
                      child: Column(children: [
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
                          Positioned(
                              right: displayWidth(context) * 0.05,
                              bottom: displayHeight(context) * 0.01,
                              child: IconButton(
                                onPressed: () =>
                                    _displayTextInputDialogofphoneno(context),
                                icon: Icon(Icons.edit),
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
                          Positioned(
                              right: displayWidth(context) * 0.05,
                              bottom: displayHeight(context) * 0.01,
                              child: IconButton(
                                onPressed: () =>
                                    _displayTextInputDialogofaddress(context),
                                icon: Icon(Icons.edit),
                              )),
                        ]),
                      ),
                    ),
                  ]))))
        ]));
  }
}
