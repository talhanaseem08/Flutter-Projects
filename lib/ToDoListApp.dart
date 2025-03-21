import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "To-Do-List Application",
      home: const toDoListScreen(),
    );
  }
}

// Home Screen
class toDoListScreen extends StatefulWidget {
  const toDoListScreen({super.key});

  @override
  State<toDoListScreen> createState() => toDoListScreenState();
}

class toDoListScreenState extends State<toDoListScreen> {
  List<String> tasks = [];

  Future<void> _navigateToAddTask(BuildContext context) async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const addTaskScreen()),
    );

    if (newTask != null) {
      setState(() {
        tasks.add(newTask);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("To-Do List App"),
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Expanded(
            child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(title: Text(tasks[index]));
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: ElevatedButton(
                style: const ButtonStyle(iconSize: WidgetStatePropertyAll(30)),
                onPressed: () {
                  _navigateToAddTask(context);
                },
                child: const Icon(Icons.add)),
          )
        ]));
  }
}

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({super.key});

  @override
  State<addTaskScreen> createState() => addTaskScreenState();
}

class addTaskScreenState extends State<addTaskScreen> {
  TextEditingController taskController = TextEditingController();

  void _addTask() {
    String task = taskController.text;
    if (task.isNotEmpty) {
      Navigator.pop(context, task);
    }
  }

  void _cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Add Task")),
        body: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: taskController,
                  decoration: const InputDecoration(
                      labelText: "Add Task",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: _addTask,
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30)),
                        child: const Text("Add Task")),
                    const SizedBox(width: 20.0),
                    TextButton(
                        onPressed: _cancel,
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 30)),
                        child: const Text("Cancel"))
                  ],
                )
              ],
            )));
  }
}
