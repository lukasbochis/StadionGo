import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stadion_go_3/theme/routes.dart';
import 'package:toast/toast.dart';

class Login extends StatefulWidget {
  @override _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login>{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/logo.png",
      height: mq.size.height/4,
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress, //Um eine bestimmte Tastatur mit einem @ Zeichen zu bekommen
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black, //Beim drücken auf das Feld, den Cursor weis färben
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder( //Beim drücken auf das Feld, die Zeile unten weis färben
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintText: "something@example.com",
        labelText: "Email",
        labelStyle: TextStyle( //Beim drücken auf das Feld, das Label weis färben
          color: Colors.black,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final passwordField = Column(
      children: <Widget>[
        TextFormField(
          controller: _passwordController,
          style: TextStyle(
            color: Colors.black,
          ),
          cursorColor: Colors.black, //Beim drücken auf das Feld, den Cursor weis färben
          obscureText: true, //Eingabetext in Punkte anzeigen
          decoration: InputDecoration(
            focusedBorder: UnderlineInputBorder( //Beim drücken auf das Feld, die Zeile unten weis färben
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            hintText: "password",
            labelText: "Password",
            labelStyle: TextStyle( //Beim drücken auf das Feld, das Label weis färben
              color: Colors.black,
            ),
            hintStyle: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(2.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            MaterialButton(
              child: Text(
                "Forgot Password?",
                style: Theme.of(context).textTheme.caption.copyWith(color: Colors.black),
              ),
              onPressed: () async {
                try{
                  await _firebaseAuth.sendPasswordResetEmail(email: _emailController.text);
                  Toast.show("Passwort reset email was send", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM, backgroundColor: Colors.green);
                }
                catch(e)
                {
                  Toast.show("Enter your email", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Colors.red);
                }
              },
            )
          ],
        ),
      ],
    );

    final fields = Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            emailField,
            passwordField,
          ],
        )
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
          onPressed: () async{
            try{
              UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword( //Firebase
                  email: _emailController.text,
                  password: _passwordController.text
              );

              if (userCredential != null){
                Navigator.of(context).pushNamed(AppRoutes.menu);
              }
            }
            catch(e){
              print(e);
              _emailController.text = "";
              _passwordController.text = "";
              Toast.show("There was an error", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM, backgroundColor: Colors.red);
            }
          }
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Not a member?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Colors.black,
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.authRegister);
              },
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xFF00BCD4),
      body:Form(
        key: _formKey,
        child: SingleChildScrollView(
            padding: EdgeInsets.all(36),
            child: Container(
              height: mq.size.height, //Die ganze Höhe des Bildschirms verwenden
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround, //Platz Die Spalte
                children: <Widget>[
                  logo,
                  fields,
                  Padding(
                    padding: EdgeInsets.only(bottom: 150), //Leiste unten nach oben verschieben (Not a member?) und (Sign Up)
                    child: bottom,
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}