import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

///THIS CODE IS FOR TESTING WIDGET ONLY

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage2> {
  final Faker faker = Faker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your To Do List")),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            child: ListTile(
              leading: CircleAvatar(),
              title: Text(faker.person.name()),
              subtitle: Text(faker.lorem.toString()),
            ),
          );
        },
      ),
    );
  }
}
