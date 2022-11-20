import 'package:flutter/material.dart';
import 'package:mobile_app/features/login/presentation/screens/main/auth_screen.dart';
import 'package:mobile_app/services/di/locator_service.dart' as di;

void main() {
  di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
        useMaterial3: true,
      ),
      home: const AuthScreen(),
    );
  }
}
