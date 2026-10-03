import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MedinowApp());
}

class MedinowApp extends StatelessWidget {
  const MedinowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medinow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: LoginScreen.bgColor,
      ),
      home: const LoginScreen(),
    );
  }
}

