import 'package:flutter/material.dart';

import 'package:tourism_new/screens/auth_screen.dart';
import 'package:tourism_new/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppBase extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void printer(){
    String? name;

     print(name);

  }
  static final String id = 'app_base';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.connectionState== ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }

            else if (snapshot.hasError){
              return Center(child: Text('Something is wrong'));
            }
            else if(snapshot.hasData){
              return WelcomeScreen();
            }
            else{
              return AuthScreen();
            }
          }
        ),
      )
    );
  }
}


