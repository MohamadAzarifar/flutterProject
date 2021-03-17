import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/constants.dart';

import 'Screens/Login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimaryColor,
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
      // routes: {
      //   LoginScreen.routeName: (context) => LoginScreen(),
      //   SignUpScreen.routeName: (context) => SignUpScreen(),
      // },
      // initialRoute: LoginScreen.routeName,
    );
  }
}