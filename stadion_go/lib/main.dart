import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stadion_go/register-screen/register.dart';
import 'package:stadion_go/theme/routes.dart';
import 'package:stadion_go/views/opening_screen.dart';

//void main() => runApp(new MyFlutterApp());
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(new MyFlutterApp());
}
  //runApp(Register());
  //runApp(new MyFlutterApp());

class MyFlutterApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "StadionGo",
      routes: AppRoutes.define(),

      home: OpeningView(),
    );
  }
}