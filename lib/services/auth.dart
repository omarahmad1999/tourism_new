import 'package:firebase_auth/firebase_auth.dart';
import 'package:tourism_new/main.dart';
import 'package:tourism_new/widgets/error_message.dart' as error;
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future signIN( BuildContext context,String email,String password )async{

  // showDialog(context: context,barrierDismissible: false  ,builder: (context)=> Center(child :CircularProgressIndicator())    );

  try {

    UserCredential loggedinUser =
    await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    print('succesfully logged in');

  } on FirebaseAuthException catch (e) {

    error.errorMessage(context, e.message!);
    // }
  }
  finally {
    // Navigator.pop(context);
  }
  // navigatorKey.currentState!.popUntil((route) => route.isFirst);

}


Future signUp(BuildContext context,String email,String password)async{
  try {
    final userCredential =
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

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