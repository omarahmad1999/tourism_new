import 'package:flutter/material.dart';

import 'package:tourism_new/screens/login_screen.dart';
import 'package:tourism_new/screens/registration_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
    isLogin? LoginScreen(onClickedSignUp: toggle):
        RegistrationScreen(onClickedSignIn: toggle,);

  void toggle() => setState(() => isLogin =! isLogin);



}
