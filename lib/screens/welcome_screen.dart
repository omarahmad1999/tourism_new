import 'package:flutter/material.dart';
import 'package:tourism_new/screens/detection_screen.dart';
import 'package:tourism_new/screens/profile_screen.dart';
import 'package:tourism_new/screens/trivia_screen.dart';
import 'package:tourism_new/constants.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _selectedIndex =1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('welcome'),backgroundColor: kAppBarColour,),
      bottomNavigationBar: BottomNavigationBar(items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.gamepad), label: 'Trivia')
      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _selectedIndex==1?  DetectionScreen():_selectedIndex==0?ProfileScreen():TriviaScreen()
      ,
    );
  }
}
