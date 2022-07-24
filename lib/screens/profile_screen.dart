import 'package:flutter/material.dart';
import 'package:tourism_new/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kScaffoldColour,
        body: Column(
          children: [
            Text('asdasdsadasdasdasdas'),
            ElevatedButton(onPressed:() => FirebaseAuth.instance.signOut(), child: Text('log out'))
          ],
        )
    );
  }
}
