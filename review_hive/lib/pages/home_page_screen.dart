import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:review_hive/service/show_message.dart';

class HomepageScreen extends StatefulWidget {
  HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(35, 22, 34, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "REVIEW HIVE",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        leadingWidth: 200,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              Future<bool> value = signOutFromApp();
              value.then(
                (value) {
                  if (value) {
                    Navigator.of(context).pushNamed("signup_screen");
                  } else {
                    showMessage(context, "Something Went Wrong!");
                    return;
                  }
                },
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),
      ),
    );
  }

  Future<bool> signOutFromApp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    return true;
  }
}
