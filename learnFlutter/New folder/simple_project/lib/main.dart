import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Dynamic App"), centerTitle: true),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              count.toString(),
              style: TextStyle(fontSize: 20 + double.parse(count.toString())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (count != 1) {
                      setState(() {
                        count--;
                      });
                    }
                    print(count);
                  },
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      count++;
                    });
                    print(count);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
