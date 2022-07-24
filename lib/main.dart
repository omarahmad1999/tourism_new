import 'package:flutter/material.dart';
import 'package:tourism_new/screens/registration_screen.dart';
import 'package:tourism_new/screens/app_base.dart';
import 'package:tourism_new/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
 );
  runApp(MyApp());

}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey ,
      initialRoute: AppBase.id,
        routes: {
          AppBase.id: (context) => AppBase(),

        }


    );
  }
}

