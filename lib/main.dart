import 'package:flutter/material.dart';

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
    return const MaterialApp(home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _todoItems = <String>[];
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          title: const Center(child: Text('Minhas Tarefas')),
        ),
      ),
      body: Container(
        child: _todoItems.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.only(right: 50, left: 50, top: 100),
                itemCount: _todoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Center(child: Text(_todoItems[index])),
                    tileColor: index % 2 == 0 ? Colors.blue : Colors.blue[100],
                  );
                },
              )
            : const Center(
                child: Text('Nenhuma tarefa adicionada'),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(32),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Adicione uma tarefa',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.red),
                            child: const Text('Cancelar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        ElevatedButton(
                          child: const Text('Adicionar'),
                          onPressed: () {
                            setState(() {
                              _todoItems.add(_controller.text);
                              _controller.clear();
                              Navigator.of(context).pop();
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              });
        },
        tooltip: 'Adicionar Tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }
}
