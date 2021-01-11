import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {

  Future<String> getData() async {
    String mail = FirebaseAuth.instance.currentUser.email;
    FirebaseFirestore.instance.collection("users").where('email', isEqualTo: mail);
    return FirebaseAuth.instance.currentUser.email;
  }
  Widget build(BuildContext context) {
    return new Center(
      child: new Text(
        FirebaseAuth.instance.currentUser.email,
        style: new TextStyle(fontSize: 20.0),
      ),
    );
  }

}