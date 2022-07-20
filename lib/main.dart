import 'package:flutter/material.dart';
import 'package:tourism_new/screens/welcome_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

}

printdas(String x){

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
        }

    );
  }
}

