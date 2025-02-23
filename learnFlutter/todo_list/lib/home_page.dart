import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Map<String, dynamic>> task = [];

  void addTask(String taskName) {
    setState(() {
      task.add({"name": taskName, "status": false});
    });
  }

  void removeTask(int index) {
    setState(() {
      task.removeAt(index);
    });
  }

  void toggleTaskStatus(int index) {
    setState(() {
      task[index]["status"] = !task[index]["status"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Your To Do List!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.8,
              ),
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 3),
            ),
            tabs: [
              Tab(icon: Icon(Icons.menu), text: "All Task"),
              Tab(icon: Icon(Icons.check), text: "Done"),
              Tab(icon: Icon(Icons.timer), text: "Pending"),
            ],
            dividerColor: Colors.white,
          ),
          backgroundColor: Colors.blue,
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            buildTaskList(task),
            buildTaskList(task.where((task) => task["status"]).toList()),
            buildTaskList(task.where((task) => !task["status"]).toList()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddTaskDialog,
          backgroundColor: Colors.blue,
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTaskList(List<Map<String, dynamic>> taskList) {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (contex, index) {
        return Dismissible(
          onDismissed: (direction) {
            int originalIndex = task.indexOf(taskList[index]);

            if (direction == DismissDirection.endToStart) {
              if (originalIndex != -1) {
                setState(() {
                  task.removeAt(originalIndex);
                });
              }
            } else {
              Navigator.of(context).pop(false);
            }
          },
          confirmDismiss: (direction) {
            return showDialog(
              context: context,
              builder: (contex) {
                return AlertDialog(
                  title: Text("Delte Confirmation"),
                  content: Text("Are your sure to delete this task?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text("Yes"),
                    ),
                  ],
                );
              },
            );
          },
          direction: DismissDirection.endToStart,
          background: Container(
            padding: EdgeInsets.only(right: 20),
            color: Colors.red,
            alignment: Alignment.centerRight,
            child: Icon(Icons.delete, size: 20),
          ),
          key: Key(index.toString()),
          child: ListTile(
            title: Text(taskList[index]["name"]),
            leading: Checkbox(
              value: taskList[index]["status"],
              onChanged: (value) {
                toggleTaskStatus(task.indexOf(taskList[index]));
              },
            ),
            trailing: IconButton(
              onPressed: () => removeTask(task.indexOf(taskList[index])),
              icon: Icon(Icons.delete, color: Colors.red),
            ),
          ),
        );
      },
    );
  }

  void _showAddTaskDialog() {
    TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Input New Task"),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: TextField(
              controller: taskController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.add_task),
                hintText: "Give Your Task Name",
                labelText: "New Task",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Icon(Icons.close, color: Colors.red),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  addTask(taskController.text);
                }
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Icon(Icons.check, color: Colors.white),
            ),
          ],
        );
      },
    );
  }
}
