import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:review_hive/pages/home_page_screen.dart';
import 'package:review_hive/pages/sign_in_screen.dart';
import 'package:review_hive/pages/sign_up_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Map<String, WidgetBuilder> routes = {
    "signin_screen": (BuildContext context) => SignInScreen(),
    "signup_screen": (BuildContext context) => SignUpScreen(),
    "home_screen": (BuildContext context) => HomepageScreen()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Review Hive",
      theme: ThemeData.dark(),
      home: checkUserLoggedIn() ? HomepageScreen() : SignUpScreen(),
      routes: routes,
    );
  }

  bool checkUserLoggedIn() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }
}
