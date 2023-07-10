import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'package:review_hive/service/shared_prefrences_class.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Auth();
  final Logger logger = Logger();

  Future<String> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "true";
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      return e.code;
    }
  }

  Future<String> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      SharedPrefrencesClass prefs = SharedPrefrencesClass();
      prefs.boolValueSaveToSharedPrefrence("loggedIn", true);
      return "true";
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      return e.code;
    }
  }
}
