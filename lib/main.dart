import 'package:Online_grocery_app/Authentication/Login.dart';
import 'package:Online_grocery_app/Authentication/Register.dart';
import 'package:Online_grocery_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:LoginScreen());
  }
}
