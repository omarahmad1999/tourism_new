import 'package:flutter/material.dart';

import 'package:tourism_new/screens/login_screen.dart';
import 'package:tourism_new/screens/registration_screen.dart';

class authScreen extends StatefulWidget {
  const authScreen({Key? key}) : super(key: key);

  @override
  State<authScreen> createState() => _authScreenState();
}

class _authScreenState extends State<authScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>
    isLogin? LoginScreen(onClickedSignUp: toggle):
        RegistrationScreen(onClickedSignIn: toggle,);

  void toggle() => setState(() => isLogin =! isLogin);



}
