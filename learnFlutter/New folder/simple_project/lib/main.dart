import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Simple Apps")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 20,
              color: Colors.green,
              child: Text(
                "Box 1",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 1.5,
                  decorationColor: Colors.white,
                ),
              ),
            ),
            Container(
              width: 150,
              height: 20,
              color: Colors.blue,
              child: Text(
                "Box 2",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 1.5,
                  decorationColor: Colors.white,
                ),
              ),
            ),
            Container(
              width: 90,
              height: 20,
              color: Colors.yellow,
              child: Text(
                "Box 3",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 1.5,
                  decorationColor: Colors.white,
                ),
              ),
            ),
            Container(
              width: 300,
              height: 20,
              color: Colors.red,
              child: Text(
                "Box 4",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10,
                  fontFamily: 'Inter',
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid,
                  decorationThickness: 1.5,
                  decorationColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
