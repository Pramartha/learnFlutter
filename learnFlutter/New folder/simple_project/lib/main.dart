import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Date")),
        body: Center(
          child: Text(
            DateFormat.yMMMEd().format(DateTime.now()),
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
