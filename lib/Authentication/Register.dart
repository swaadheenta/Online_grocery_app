import 'package:cloud_firestore/cloud_firestore.dart';

import 'Login.dart';
import 'package:Online_grocery_app/Authentication/auth.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String username;
  String phoneno;
  
  String error;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
            color: Colors.blue,
            height: displayHeight(context),
            width: displayWidth(context),
          )),
          Positioned(
            top: displayHeight(context) * 0.35,
            child: Container(
              height: displayHeight(context) * 0.65,
              width: displayWidth(context) * 1.0,
              color: Colors.white,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.1,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? "Enter an email" : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email), hintText: "Email"),
                        onChanged: (val) {
                          setState(() {
                            email = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: TextFormField(
                        validator: (val) => val.length < 6
                            ? "The Password should be atleast 6 characters long"
                            : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock), hintText: "Password"),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: TextFormField(
                        validator: (val) => val.length < 6
                            ? "Username should be atleast 6 characters long"
                            : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.verified_user_rounded), hintText: "Username"),
                        //obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.02,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: TextFormField(
                        validator: (val) => val.length !=10
                            ? "phoneno should be of 10 characters"
                            : null,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone), hintText: "Phoneno"),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() {
                            phoneno = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: displayHeight(context) * 0.04,
                      width: displayWidth(context) * 0.8,
                    ),
                    RaisedButton(
                        child: Text("Sign Up"),
                        onPressed: () async {
                          if (_formkey.currentState.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password,username,phoneno);
                            //  FirebaseFirestore.instance.collection("Users").doc("Helo").set({"name":"Happy"});
                            if (result == null) {
                              setState(() {
                                error = "Please enter a valid email";
                              });
                            }
                          }
                        })
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: displayHeight(context) * 0.9,
              child: Row(
                children: [
                  Text("Already have an account ? "),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (Context) => LoginScreen()));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ))
        ],
      ),
    );
  }
}
