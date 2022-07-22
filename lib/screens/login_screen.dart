import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/main.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
// import 'detection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism_new/widgets/error_message.dart' as error;
class LoginScreen extends StatefulWidget {
  static final String id = 'login_screen';
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
              ),
          SizedBox(
            height: 16,
          ),
          RichText(text: TextSpan(style: TextStyle(color: Colors.black,fontSize: 16),
              text: 'No account?  ',
             children: [TextSpan(recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignUp,
    text: 'Sign up',style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline))
    ])) ,
        ],
      ),
    );
  }
  Future signIN( )async{
    showDialog(context: context,barrierDismissible: false  ,builder: (context)=> Center(child :CircularProgressIndicator())    );
    try {

      UserCredential loggedinUser =
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(), password: passwordController.text.trim());
        print('succesfully logged in');

    } on FirebaseAuthException catch (e) {

      error.errorMessage(context, e.message!);
      // }
    }
    Navigator.pop(context);

   // navigatorKey.currentState!.popUntil((route) => route.isFirst);

  }
}


