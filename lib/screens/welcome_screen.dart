import 'package:flutter/material.dart';
import 'package:tourism_new/widgets/rounded_button.dart';
import 'package:tourism_new/constants.dart';
import 'package:tourism_new/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatelessWidget {
  static final String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          print(snapshot.data);
          if(snapshot.hasData){
            return homePage();
          }
          else{
            return LoginScreen();
          }
        }
      )
    );
  }
}


class homePage extends StatelessWidget {

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
