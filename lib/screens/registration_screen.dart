import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
import 'package:flutter/gestures.dart';
import 'package:tourism_new/services/auth.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  final VoidCallback onClickedSignIn;

  const RegistrationScreen({
    Key? key,
    required this.onClickedSignIn,

  }): super(key:key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController= TextEditingController();
  final passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColour,
      body:  Form(
        key: _formKey,
        child: Column(
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
      TextFormField(
          controller: emailController,
          obscureText: false,
          textAlign: TextAlign.center,
          cursorColor: Colors.white ,
          decoration: kTextFieldInputDecoration.copyWith(
              hintText: 'Email'),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator:
              (email)=> email==null ||!EmailValidator.validate(email)?'Enter a valid email':null

      ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white ,
                  decoration: kTextFieldInputDecoration.copyWith(
                      hintText: 'Password'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator:
                      (value)=> value==null ||value.length<6?'Enter min 6 characters':null
              ),
              const SizedBox(
                height: 8,
              ),
              RoundedButton(
                  colour: kDarkCoralColour,
                  title: 'Register',
                  onPressed: () async {
                    signUp(context,emailController.text.trim(),passwordController.text.trim(),_formKey);
                  }
                  ),
              const SizedBox(
                height: 16,
              ),
              RichText(text: TextSpan(style: const TextStyle(color: Colors.black,fontSize: 16),
                  text: 'Already have an account?  ',
                  children: [TextSpan(recognizer: TapGestureRecognizer()..onTap = widget.onClickedSignIn,
                      text: 'Sign up',style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                  ]))
            ],
          ),
      ),

    );
  }


    }



