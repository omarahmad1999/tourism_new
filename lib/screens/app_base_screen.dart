import 'package:flutter/material.dart';

import 'package:tourism_new/screens/auth_screen.dart';
import 'package:tourism_new/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppBase extends StatelessWidget {

  static const  String id = 'app_base';

  const AppBase({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return const Center(child:  CircularProgressIndicator());
          }

          else if (snapshot.hasError){
            return const Center(child:  Text('Something is wrong'));
          }
          else if(snapshot.hasData){
            return const WelcomeScreen();
          }
          else{
            return const AuthScreen();
          }
        }
      ),
    );
  }
}


