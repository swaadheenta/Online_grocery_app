import 'package:Online_grocery_app/Helpers/Devicesize.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String email = "";
  String password = "";
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
                child: Column(
                  children: [
                    SizedBox(
                      height: displayHeight(context) * 0.08,
                      width: displayWidth(context) * 0.8,
                    ),
                    Container(
                      width: displayWidth(context) * 0.8,
                      child: TextFormField(
                        decoration: InputDecoration(
                           prefixIcon: Icon(Icons.email),
                          hintText: "Email"),
                          
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
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                         
                            hintText: "Password"),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                      height: displayHeight(context) * 0.04,
                      width: displayWidth(context) * 0.8,
                    ),
                    RaisedButton(
                      child: Text("Sign In"),
                      onPressed: () async {
                      print(email);
                      print(password);
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
