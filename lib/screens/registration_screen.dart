import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
import 'package:flutter/gestures.dart';
import 'package:tourism_new/widgets/input_text_field.dart';
import 'package:tourism_new/services/auth.dart';
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
                  'assets/sphinx.png',
                  height: 320,
                  width: 320,
                ),
              ),
            ),
            InputTextField(controller: emailController, hint: 'email'),
            SizedBox(
              height: 10,
            ),
            InputTextField(controller: passwordController,hint: 'password'),
            SizedBox(
              height: 8,
            ),
            RoundedButton(
                colour: kDarkCoralColour,
                title: 'Register',
                onPressed: () async {
                  signUp(context,emailController.text.trim(),passwordController.text.trim());
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



