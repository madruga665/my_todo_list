import 'package:flutter/material.dart';

class NewTask extends StatefulWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: const Center(child: Text('Adicionar Nova Tarefa')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: const Center(
        child: Text('Aqui vc add novas tasks'),
      ),
    );
  }
}
