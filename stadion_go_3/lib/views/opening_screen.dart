import 'package:flutter/material.dart';
import 'package:stadion_go_3/theme/routes.dart';

class OpeningView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context); //MediaQuery um die Widget größe in relation zur Screen größe

    final logo = Image.asset(
      "assets/logo.png",
      height: mq.size.height/4,
    );

    final registerButton = Material(
      elevation: 5.0, //Schatten des Button Z Koordinate
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text (
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: (){
            Navigator.of(context).pushNamed(AppRoutes.authRegister);
          }
      ),
    );

    final titleField = Material(
      color: Color(0xFF00BCD4),
      child: Text(
        "StadionGo",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40.0,
            color: Colors.black,
            fontWeight: FontWeight.bold
        )
      ),
    );

    final loginButton = Material(
      elevation: 5.0, //Schatten des Button Z Koordinate
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text (
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: (){
            Navigator.of(context).pushNamed(AppRoutes.authLogin);
          }
      ),
    );

    final buttons = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.fromLTRB(0,15,0,70), //Abstände (Versätze) in alle Richtungen
          child: registerButton,
        ),
      ],
    );

    return Scaffold(
        backgroundColor: Color(0xFF00BCD4),
        body: Padding(
          padding: EdgeInsets.all(36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 50),
                child: logo,
              ),
              titleField,
              buttons,
            ],
          ),
        )
    );
  }

}