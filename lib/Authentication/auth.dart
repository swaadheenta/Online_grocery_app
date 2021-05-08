import 'package:Online_grocery_app/Authentication/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<Userinfo> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Userinfo _userFromFirebaseUser(User user) {
    return user != null ? Userinfo(uid: user.uid) : null;
  }

  // Register using email and password !!
  Future registerWithEmailAndPassword(
      String email, String password, String username, String phoneno) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);

      FirebaseFirestore.instance
          .collection("Users")
          .doc(user.uid.toString())
          .collection("Details")
          .doc(username)
          .set({"name": username, "phoneno": phoneno, "price": 0, "email":email});
      FirebaseFirestore.instance
          .collection("Orders")
          .doc(user.uid.toString())
          .set({
        "name": username,
        "phoneno": phoneno,
        "gender": "ebb",
        "address": "hghjgjhh",
        "id":user.uid.toString(),
        "pending":true,
        "completed":false,
        
      });
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //  Sign In using email and password !!
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
