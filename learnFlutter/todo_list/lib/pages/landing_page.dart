import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu_book, size: 100, color: Colors.black),
                ),
                Text(
                  "LET'S MAKE YOUR TO-DO LIST!",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, '/homepage');
              },
              child: SizedBox(
                width: 120,
                height: 20,
                child: Center(
                  child: Text(
                    "Let's Goo...",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
