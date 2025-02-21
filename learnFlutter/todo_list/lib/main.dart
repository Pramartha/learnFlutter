import 'package:flutter/material.dart';

main() {
  runApp(ToDoList());
}

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Your To Do List!", style: TextStyle(fontSize: 20)),
            actions: [
              Builder(
                builder:
                    (innerContext) => IconButton(
                      onPressed: () {
                        showDialog(
                          context: innerContext,
                          builder: (context) {
                            return AddTaskDialog();
                          },
                        );
                      },
                      icon: Icon(Icons.add),
                    ),
              ),
              SizedBox(width: 15),
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
              Center(child: Text("Done")),
              Center(child: Text("Pending")),
            ],
          ),
        ),
      ),
    );
  }
}

class AddTaskDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController();
    return AlertDialog(
      title: Text("Input New Task"),
      content: SizedBox(
        width: 40,
        child: TextField(
          controller: taskController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.task),
            hintText: "Give Your Task Name",
            labelText: "New Task",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close, color: Colors.red),
        ),
        ElevatedButton(
          onPressed: () {
            String newTask = taskController.text;
            print("Tugas Baru: $newTask");
            Navigator.pop(context);
          },
          child: Icon(Icons.check, color: Colors.blue),
        ),
      ],
    );
  }
}
