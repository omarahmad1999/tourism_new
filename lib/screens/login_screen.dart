import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/widgets/rounded_button_widget.dart';
import 'package:tourism_new/services/auth_service.dart';
import 'package:tourism_new/widgets/input_text_field_widget.dart';
class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  final VoidCallback onClickedSignUp;

  const LoginScreen({
    Key? key,
    required this.onClickedSignUp,

}): super(key:key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController= TextEditingController();
  final passwordController=TextEditingController();
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
                'assets/sphinx.png',
                height: 320,
                width: 320,

              ),
            ),
          ),
          InputTextField(controller: emailController, hint: 'email'),
          const SizedBox(
            height: 10,
          ),
          InputTextField(controller: passwordController,hint: 'password'),
          const SizedBox(
            height: 8,
          ),
          RoundedButton(
              colour: kLightCoralColour,
              title: 'Login',
              onPressed: () async {
                signIN(context,emailController.text.trim(),passwordController.text.trim());
                }
              ),
          const SizedBox(
            height: 16,
          ),
          RichText(text: TextSpan(style: const TextStyle(color: Colors.black,fontSize: 16),
              text: 'No account?  ',
             children: [TextSpan(recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
    text: 'Sign up',style: const TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline))
    ])) ,
        ],
      ),
    );
  }

}


