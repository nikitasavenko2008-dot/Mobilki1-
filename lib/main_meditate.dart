import 'package:flutter/material.dart';
import 'screens/meditate_screen.dart';

void main() {
  runApp(const MeditateApp());
}

class MeditateApp extends StatelessWidget {
  const MeditateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meditate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white),
      home: const MeditateScreen(),
    );
  }
}
