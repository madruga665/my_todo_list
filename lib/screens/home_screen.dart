import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> todoItems = [
    'teste 1',
    'teste 2',
    'teste 3',
    'teste 4',
    'teste 5',
    'teste 6',
    'teste 7',
    'teste 8',
    'teste 9'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: const Center(child: Text('Minhas Tarefas')),
          automaticallyImplyLeading: false,
        ),
      ),
      body: Container(
        child: todoItems.isNotEmpty
            ? Scrollbar(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10.0),
                  itemCount: todoItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ListTile(
                          onTap: () {
                            print('CRICOU NA TASK ${todoItems[index]}');
                            Navigator.pushNamed(context, '/newTask',
                                arguments: todoItems[index]);
                          },
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10.0),
                          leading: Container(
                            padding: const EdgeInsets.only(right: 12),
                            decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(
                                      width: 1, color: Colors.white)),
                            ),
                            child: CircleAvatar(
                              child: Text(
                                (index + 1).toString(),
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          title: Text(
                            todoItems[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          tileColor: Colors.blue),
                    );
                  },
                ),
              )
            : const Center(
                child: Text('Nenhuma tarefa adicionada'),
              ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/newTask');
          }),
    );
  }
}
