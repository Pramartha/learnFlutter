import 'package:flutter/material.dart';

main() {
  runApp(ToDoList());
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.book_rounded, size: 10),
            title: Text(
              "Your To Do List!",
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Icon(Icons.menu),
              Padding(padding: EdgeInsets.only(right: 5)),
            ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.menu), text: "All Task"),
                Tab(icon: Icon(Icons.check), text: "Done"),
                Tab(icon: Icon(Icons.timer), text: "Pending"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("All")),
              Center(child: Text("All")),
              Center(child: Text("All")),
            ],
          ),
        ),
      ),
    );
  }
}
