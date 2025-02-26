import 'package:flutter/material.dart';
import 'package:todo_list/pages/landing_page.dart';
import 'pages/home_page.dart';
import 'pages/complate_task.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/homepage': (context) => const HomePage(),
      },
    );
  }
}
