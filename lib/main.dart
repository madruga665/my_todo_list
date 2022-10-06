import 'package:flutter/material.dart';
import 'package:my_todo_list/screens/home_screen.dart';
import 'package:my_todo_list/screens/new_task.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const Home(),
        '/newTask': (context) => const NewTask()
      },
    );
  }
}
