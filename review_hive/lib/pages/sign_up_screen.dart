import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:review_hive/models/user.dart';
import 'package:review_hive/pages/sign_in_screen.dart';
import 'package:review_hive/repository/db_functions.dart';
import 'package:review_hive/service/auth.dart';
import 'package:review_hive/service/show_message.dart';
import 'package:review_hive/widgets/back_button.dart';
import 'package:review_hive/widgets/blue_button.dart';
import 'package:review_hive/widgets/custom_input_boxes.dart';
import 'package:review_hive/widgets/divider.dart';
import 'package:review_hive/widgets/heavy_container.dart';
import 'package:review_hive/widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final Auth _auth = Auth();
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
  }

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
            heavyContainer(context: context, textValue: "Create your Account"),
            const Dividers.horizontal(
              color: Colors.transparent,
              thicknes: 10,
            ),
            CustomInputBox.text(
              hintText: "Enter your user name",
              iconValue: Icons.person,
              controller: widget._username,
            ),
            const Dividers.horizontal(
              thicknes: 10,
              color: Colors.transparent,
            ),
            CustomInputBox.text(
              hintText: "Enter your Email",
              iconValue: Icons.email,
              controller: widget._email,
            ),
            const Dividers.horizontal(
              thicknes: 10,
              color: Colors.transparent,
            ),
            PasswordField(controller: widget._password),
            blueButton(
              textValue: "Register",
              context: context,
              onPressed: () {
                registerUser();
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 20,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text("Already have an Account? "),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return SignInScreen();
                          },
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors
                          .transparent), // Set transparent background color
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color.fromARGB(255, 232, 6, 6),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  registerUser() {
    String? username = widget._username.text;
    String? email = widget._email.text;
    String? password = widget._password.text;

    User user = User();
    if (username.isEmpty) {
      showMessage(context, "User name can't be empty!");
      return;
    }
    if (email.isEmpty) {
      showMessage(context, "Email can't be empty!");
      return;
    }
    if (password.isEmpty) {
      showMessage(context, "Password can't be empty!");
      return;
    }

    email = email.toLowerCase();
    email = email.trim();
    password = password.trim();

    user.setUsername = username;
    user.setEmail = email;
    user.setPassword = password;

    addUserToDatabase(user);

    Future<String> value =
        widget._auth.registerWithEmailAndPassword(email, password);
    value.then(
      (value) {
        if (value == "true") {
          Navigator.of(context).pushNamed("signin_screen");
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
