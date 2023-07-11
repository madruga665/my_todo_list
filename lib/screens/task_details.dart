import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Detalhes da tarefa')),
        automaticallyImplyLeading: false,
      ),
      body: const Center(child: Text('AQUI VÃO OS DETALHES DA TAREFA')),
    );
  }
}
