import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism_new/widgets/error_message.dart' as error;
import 'package:flutter/gestures.dart';

class RegistrationScreen extends StatefulWidget {
  static final String id = 'registration_screen';
  final VoidCallback onClickedSignIn;

  const RegistrationScreen({
    Key? key,
    required this.onClickedSignIn,

  }): super(key:key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailController= TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColour,
      body:  Column(
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
              height: 8,
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
                colour: kDarkCoralColour,
                title: 'Register',
                onPressed: () async {

                  try {
                    final userCredential =
                    await _auth.createUserWithEmailAndPassword(
                        email: emailController.text.trim(), password: passwordController.text.trim());

                  } on FirebaseAuthException catch (e) {
                    error.errorMessage(context, e.message!);
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                  }
                ),
            SizedBox(
              height: 16,
            ),
            RichText(text: TextSpan(style: TextStyle(color: Colors.black,fontSize: 16),
                text: 'Already have an account?  ',
                children: [TextSpan(recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                    text: 'Sign up',style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                ]))
          ],
        ),

    );
  }
}
