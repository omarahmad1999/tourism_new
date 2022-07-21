import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
// import 'detection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism_new/widgets/error_message.dart' as error;

class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController= TextEditingController();
  final passwordController=TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColour,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Hero(
              tag: 'wanderer',
              child: Image.asset(
                'assets/wanderer.png',
                height: 220,
                width: 110,
                color: Colors.black,
              ),
            ),
          ),
          TextField(
            controller: emailController,
            obscureText: false,
            textAlign: TextAlign.center,
            cursorColor: Colors.white ,
            decoration: kTextFieldInputDecoration.copyWith(
                hintText: 'Email'),

          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: passwordController,
            obscureText: false,
            textAlign: TextAlign.center,
            cursorColor: Colors.white ,
            decoration: kTextFieldInputDecoration.copyWith(
                hintText: 'Password'),
          ),
          SizedBox(
            height: 8,
          ),
          RoundedButton(
              colour: kLightCoralColour,
              title: 'Login',
              onPressed: () async {
                setState(() {
                  showSpinner = true;
                });
                signIN();
                }
              )
        ],
      ),
    );
  }
  Future signIN( )async{
    try {

      UserCredential loggedinUser =
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());

        print('succesfully logged in');

    } on FirebaseAuthException catch (e) {

      error.errorMessage(context, e.message!);
      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
    } finally {
      setState(() {
        showSpinner = false;
      });
    }
  }
}


