import 'package:flutter/material.dart';
import 'package:mobile_app/pages/authentication_page.dart';
import 'package:mobile_app/pages/user_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/reg',
      routes: {
        '/reg': (context) => const AuthPage(),
        '/main': (context) => const HomePage(),
        '/user': (context) => const UserInfo(),
      },
    );
  }
}
