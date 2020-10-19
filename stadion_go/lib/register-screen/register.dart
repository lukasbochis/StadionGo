import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Material(
      color: Colors.lightGreen,
      child: Center(
        child: Text(
            "Your lucky number is ${generateLuckyNumber()}",
            textDirection: TextDirection.ltr,
            style: TextStyle(color: Colors.white, fontSize: 30.0)
        ),
      ),
    );
  }




  int generateLuckyNumber(){
    var random = Random();
    int luckyNumber = random.nextInt(10);

    return luckyNumber;
  }
  
}