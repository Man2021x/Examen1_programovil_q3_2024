import 'package:flutter/material.dart';

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({super.key});

  @override
  TaskListWidgetState createState() => TaskListWidgetState();
}

class TaskListWidgetState extends State<TaskListWidget> {
  List<Task> tasks = [
    Task('John Doe', 'Lorem ipsum dolor sit amet', DateTime(2024, 8, 1)),
    Task('John Doe', 'Lorem ipsum dolor sit amet', DateTime(2024, 8, 15)),
    Task('John Doe', 'Lorem ipsum dolor sit amet', DateTime(2024, 8, 14)),
    
  ];

  void _addTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController nameController = TextEditingController();
        final TextEditingController descriptionController = TextEditingController();

        return AlertDialog(
          title: const Text('Agregar Tarea'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Nombre'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Descripción'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Agregar'),
              onPressed: () {
                setState(() {
                  tasks.add(Task(
                    nameController.text,
                    descriptionController.text,
                    DateTime.now(),
                  ));
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tareas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.edit, color: Colors.black),
              title: Text(task.name),
              subtitle: Text(task.description),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text('${task.date.month}/${task.date.day}'),
                  const SizedBox(width: 10),
                  const Icon(Icons.star, color: Colors.amber),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.edit),
      ),
    );
  }
}

class Task {
  String name;
  String description;
  DateTime date;

  Task(this.name, this.description, this.date);
}
