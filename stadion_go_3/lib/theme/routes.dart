import 'package:flutter/cupertino.dart';
import 'package:stadion_go_3/views/login_screen.dart';
import 'package:stadion_go_3/views/menu.dart';
import 'package:stadion_go_3/views/opening_screen.dart';
import 'package:stadion_go_3/views/register_screen.dart';

class AppRoutes{
  AppRoutes._();

  static const String authLogin = 'auth-login';
  static const String authRegister = 'auth-register';
  static const String menu = '/menu';
  static const String openingView = '/opening-view';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),
      openingView: (context) => OpeningView(),

      menu: (context) => MenuScreen(),
    };
  }
}