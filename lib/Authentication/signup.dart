import 'package:Online_grocery_app/Authentication/auth.dart';
import 'package:Online_grocery_app/Authentication/firstscreen.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:Online_grocery_app/home.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  signup({Key key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  bool loginisselected = false;
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = " ";
  String address = "";
  String gender = "";
  String phoneno = "";
  String username = "";
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Card(
          elevation: 10.0,
          child: Container(
              height: displayHeight(context) * 0.075,
              child: Column(
                children: [
                  Divider(
                    height: displayHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              loginisselected = true;
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => first()));
                            });
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: loginisselected
                                    ? Colors.blue
                                    : Colors.black,
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          )),
                      Text(
                        "Register",
                        style: TextStyle(
                            color:
                                !loginisselected ? Colors.blue : Colors.black,
                            fontFamily: "Breeserif",
                            fontSize: displayWidth(context) * 0.045),
                      ),
                    ],
                  )
                ],
              ))),
      !loginisselected
          ? Container(
              height: displayHeight(context) * 0.95,
              width: displayWidth(context),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context),
                    ),
                    Container(
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          ),
                          TextFormField(
                            validator: (val) =>
                                val.isEmpty ? "Enter an email" : null,
                            decoration: InputDecoration(

                                // prefixIcon: Icon(Icons.email), hintText: "Email",
                                // labelText: "Email",
                                // alignLabelWithHint: true
                                ),
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.8,
                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          ),
                          TextFormField(
                            validator: (val) => val.length < 6
                                ? "The Password should be atleast 6 characters long"
                                : null,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.remove_red_eye)),
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.8,
                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          ),
                          TextFormField(
                            validator: (val) => val.length == 0
                                ? "Address cannot be empty"
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                address = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.8,
                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Phone no",
                            style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          ),
                          TextFormField(
                            validator: (val) => val.length == 10
                                ? null
                                : "Phone number should consists of 10 characters onlu",
                           
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                phoneno = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.8,
                      //color: Colors.yellow,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User name",
                            style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          ),
                          TextFormField(
                            validator: (val) => val.length < 6
                                ? "Username should consist of atleast 6 characters"
                                : null,
                        
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                username = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.04,
                      width: displayWidth(context) * 0.8,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (_formkey.currentState.validate()) {
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email, password, username, phoneno,address);
                          //  FirebaseFirestore.instance.collection("Users").doc("Helo").set({"name":"Happy"});
                          if (result == null) {
                            setState(() {
                              error = "Please enter a valid email";
                            });
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (Context) => Homepage()));
                          }
                        }
                      },
                      child: Container(
                        width: displayWidth(context) * 0.8,
                        height: displayHeight(context) * 0.07,
                        color: Colors.blue[800],
                        child: Center(
                            child: Text(
                          "Register",
                          style: TextStyle(
                              fontFamily: "Breeserif",
                              fontSize: displayWidth(context) * 0.045,
                              color: Colors.white),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            )
          : first()
    ]));
  }
}
