import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Inisialisasi Hive
  await Hive.openBox('todoBox'); // Membuka database lokal
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TodoScreen());
  }
}

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final _todoBox = Hive.box('todoBox'); // Mengakses database Hive
  List<Map<String, dynamic>> tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTasks(); // Memuat data dari Hive saat aplikasi dibuka
  }

  void loadTasks() {
    final storedTasks = _todoBox.get('tasks', defaultValue: []);

    setState(() {
      tasks =
          (storedTasks as List)
              .map(
                (e) => Map<String, dynamic>.from(e as Map),
              ) // 🔥 Konversi ke Map<String, dynamic>
              .toList();
    });
  }

  void saveTasks() {
    _todoBox.put('tasks', tasks);
  }

  void addTask() {
    setState(() {
      tasks.add({"task": taskController.text, "completed": false});
      taskController.clear();
    });
    saveTasks();
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index]["completed"] = !tasks[index]["completed"];
    });
    saveTasks();
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do Lists")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: InputDecoration(hintText: "Tambahkan tugas"),
                  ),
                ),
                IconButton(icon: Icon(Icons.add), onPressed: addTask),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: tasks[index]["completed"],
                    onChanged: (bool? newValue) {
                      toggleTaskStatus(index);
                    },
                  ),
                  title: Text(
                    tasks[index]["task"],
                    style: TextStyle(
                      decoration:
                          tasks[index]["completed"]
                              ? TextDecoration.lineThrough
                              : TextDecoration.none, // Coret teks jika selesai
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
