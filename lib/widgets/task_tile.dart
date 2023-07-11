import 'package:flutter/material.dart';

class TaskTile extends StatefulWidget {
  const TaskTile({Key? key, required this.todoList, required this.index})
      : super(key: key);
  final List<String> todoList;
  final int index;

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/taskDetails',
                arguments: widget.todoList[widget.index]);
          },
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
          leading: Container(
            padding: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(width: 1, color: Colors.white)),
            ),
            child: CircleAvatar(
              child: Text(
                (widget.index + 1).toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          title: Text(
            widget.todoList[widget.index],
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          tileColor: Colors.blue),
    );
  }
}
