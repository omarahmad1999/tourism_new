import 'package:flutter/material.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/screens/login_screen.dart';
import 'package:tourism_new/screens/auth_screen.dart';
import 'package:tourism_new/screens/detection_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  void printer(){
    String? name;

     print(name);

  }
  static final String id = 'welcome_screen';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState== ConnectionState.waiting){
            return Center(child: CircularProgressIndicator()); 
          }

          else if (snapshot.hasError){
            return Center(child: Text('Something is wrong'));
          }
          else if(snapshot.hasData){
            return DetectionScreen();
          }
          else{
            return AuthScreen();
          }
        }
      )
    );
  }
}


class profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColour,
      appBar: AppBar(
        backgroundColor: kAppBarColour,
        title: Center(
          child: Text(
            'Wander',
            style: TextStyle(fontFamily: 'Flavors', fontSize: 50.0),
          ),
        ),
      ),
      body: Column(
        children: [
          Text('asdasdsadasdasdasdas'),
          ElevatedButton(onPressed:() => FirebaseAuth.instance.signOut(), child: Text('log out'))
        ],
      )
    );
  }
}
