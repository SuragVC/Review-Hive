class SignIn {
  late String _email;
  late String _password;
  SignIn();
  String get email => _email;
  String get password => _password;

  set setEmail(String email) => _email = email;
  set setPassword(String password) => _password = password;
}
