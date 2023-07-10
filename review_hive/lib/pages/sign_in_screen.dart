import 'package:flutter/material.dart';
import 'package:review_hive/service/auth.dart';
import 'package:review_hive/service/show_message.dart';
import 'package:review_hive/widgets/back_button.dart';
import 'package:review_hive/widgets/blue_button.dart';
import 'package:review_hive/widgets/custom_input_boxes.dart';
import 'package:review_hive/widgets/divider.dart';
import 'package:review_hive/widgets/heavy_container.dart';
import 'package:review_hive/widgets/password_field.dart';

import '../models/sign_in.dart';
import '../widgets/loading_animation.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final Auth _auth = Auth();
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(35, 22, 34, 255),
      body: SafeArea(
        child: ListView(
          children: [
            const CustomBackButton(),
            const Dividers.horizontal(
              color: Colors.transparent,
              thicknes: 80,
            ),
            heavyContainer(context: context, textValue: "Login Your Account"),
            const Dividers.horizontal(
              color: Colors.transparent,
              thicknes: 10,
            ),
            const Dividers.horizontal(
              thicknes: 10,
              color: Colors.transparent,
            ),
            CustomInputBox.text(
              hintText: "Enter your email",
              iconValue: Icons.email,
              controller: widget._email,
            ),
            const Dividers.horizontal(
              thicknes: 10,
              color: Colors.transparent,
            ),
            PasswordField(
              controller: widget._password,
            ),
            blueButton(
              textValue: "Sign In",
              context: context,
              onPressed: () {
                loadingAnimation();
                signInUser();
              },
            ),
          ],
        ),
      ),
    );
  }

  signInUser() {
    String email = widget._email.text;
    String password = widget._password.text;

    if (email.isEmpty) {
      showMessage(context, "Email can't be empty!");
      return;
    }
    if (password.isEmpty) {
      showMessage(context, "Password can't be empty!");
      return;
    }
    email = email.trim();
    email = email.toLowerCase();
    password.trim();

    SignIn user = SignIn();
    user.setEmail = email;
    user.setPassword = password;

    Future<String> value =
        widget._auth.signInWithEmailAndPassword(email, password);
    value.then(
      (value) {
        if (value == "true") {
          Navigator.of(context).pushNamed("home_screen");
        } else {
          if (value == "invalid-email") {
            showMessage(context, "Invalid Email");
            return;
          } else if (value == "invalid-password") {
            showMessage(context, "Invalid Password");
            return;
          } else {
            showMessage(context, value);
            return;
          }
        }
      },
    );
  }
}
