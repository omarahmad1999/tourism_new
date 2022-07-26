import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism_new/screens/registration_screen.dart';

import 'package:tourism_new/widgets/error_message.dart' as error;
import 'package:tourism_new/widgets/snack_bar.dart' ;
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future signIN( BuildContext context,String email,String password)async{

  showDialog(context: context,barrierDismissible: false  ,builder: (context)=> Center(child :CircularProgressIndicator())    );

  try {

    UserCredential loggedinUser =
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);

  } on FirebaseAuthException catch (e) {
    final snackBar =snack_bar(e.message!);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);


  }
  finally {
     Navigator.pop(context);
  }


}


Future signUp(BuildContext context,String email,String password,GlobalKey<FormState> formKey )async{
  showDialog(context: context,barrierDismissible: false  ,builder: (context)=> Center(child :CircularProgressIndicator())    );
  final isValid =formKey.currentState!.validate();
  if (!isValid) return;
  try {
    final userCredential =
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

  } on FirebaseAuthException catch (e) {
    final snackBar =snack_bar(e.message!);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

  } finally {
    Navigator.pop(context);
  }
}