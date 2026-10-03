import 'package:flutter/material.dart';
import 'screens/course_screen.dart';

void main() {
  runApp(const CourseApp());
}

class CourseApp extends StatelessWidget {
  const CourseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, scaffoldBackgroundColor: Colors.white),
      home: const CourseScreen(),
    );
  }
}
