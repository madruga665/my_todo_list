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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                itemCount: _todoItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10.0),
                        leading: Container(
                          padding: const EdgeInsets.only(right: 12),
                          decoration: const BoxDecoration(
                            border: Border(
                                right:
                                    BorderSide(width: 1, color: Colors.white)),
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
                          _todoItems[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        tileColor: Colors.blue),
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
