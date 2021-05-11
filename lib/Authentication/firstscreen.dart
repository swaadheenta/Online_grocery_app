import 'package:Online_grocery_app/Authentication/Register.dart';
import 'package:Online_grocery_app/Authentication/auth.dart';
import 'package:Online_grocery_app/Authentication/signup.dart';
import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:Online_grocery_app/home.dart';
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  first({Key key}) : super(key: key);

  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  bool loginisselected = true;
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = " ";
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Card(
          elevation: 10.0,
          child: Container(
              height: displayHeight(context) * 0.4,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("GROCERY ",style: TextStyle(fontSize: displayWidth(context)*0.055,fontWeight: FontWeight.bold),),
                      Text("STORE",style: TextStyle(fontSize: displayWidth(context)*0.055,fontWeight: FontWeight.bold,color: Colors.orange)),
                    ],
                  ),
                  Container(
                      height: displayHeight(context) * 0.3,
                      width: displayWidth(context),
                      // width: displayWidth(context) * 0.6,
                      child: Image(image: AssetImage("images/i1.png"))),
                  Divider(
                    height: displayHeight(context) * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              if (loginisselected == false)
                                loginisselected = true;
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
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              loginisselected = false;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: !loginisselected
                                    ? Colors.blue
                                    : Colors.black,
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045),
                          )),
                    ],
                  )
                ],
              ))),
      loginisselected
          ? Container(
              height: displayHeight(context) * 0.6,
              width: displayWidth(context),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.05,
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
                      height: displayHeight(context) * 0.05,
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
                      height: displayHeight(context) * 0.04,
                      width: displayWidth(context) * 0.8,
                    ),
                   GestureDetector(
                     onTap: () async {
                      if (_formkey.currentState.validate()) {
                        dynamic result = await _auth.signinWithEmailAndPassword(
                            email, password);

                        if (result == null) {
                          setState(() {
                            error =
                                "Could Not sign in with those credentials !!";
                          });
                        } else {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homepage()));
                        }
                      }},
                    
                                        child: Container(
                       width: displayWidth(context)*0.8,
                       height: displayHeight(context)*0.07,
                       color: Colors.blue[800],
                       child: Center(child: Text("Login" ,style: TextStyle(
                                fontFamily: "Breeserif",
                                fontSize: displayWidth(context) * 0.045,color: Colors.white),)),
                     ),
                   )
                  ],
                ),
              ),
            )
          : signup()
    ]));
  }
}
