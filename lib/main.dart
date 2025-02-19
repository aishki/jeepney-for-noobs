import 'package:flutter/material.dart';
import 'package:jeepneyfornoobs_flutter/hidden_drawer.dart';
// import 'screens/login_screen.dart';
// import 'screens/home_screen.dart';
// import 'package:hiddendrawertutorial/screens/home_screen.dart';

void main() => runApp(JeepneyForNoobs());

class JeepneyForNoobs extends StatelessWidget {
  const JeepneyForNoobs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HiddenDrawer(),
      // routes: {
      //   "/login": (context) => LoginScreen(),
      // "/register": (context) => RegisterScreen(),
      // },
    );
  }
}
