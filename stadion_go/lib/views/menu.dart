import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget{
  MenuScreen();

  @override
  MenuScreenState createState() => MenuScreenState();
}

class MenuScreenState extends State<MenuScreen> {
  MenuScreenState();
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: null,
      body: Text(
        "Home"
      ),
    );
  }

}