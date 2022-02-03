import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  TextEditingController _textEditingController = TextEditingController();

  List<String> Tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lista de tarefas"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              TextField(
                controller: _textEditingController,
              ),
              Container(
                height: 500,
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(),
                  //builder fornece o index
                  itemCount: Tarefas
                      .length, //a partir da quantidade que tem dentro da lista
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(Tarefas[index]),
                      onLongPress: () {
                        setState(() {
                          Tarefas.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            MainAxisAlignment.end, //Alinhando os floatingbottom na direita
        children: [
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              if (_textEditingController.text.length > 0) {
                setState(() {
                  Tarefas.add(_textEditingController.text);
                });
                _textEditingController.clear(); //Limpar apos escrever
              }
            },
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            backgroundColor: Colors.orange,
            onPressed: () {
              setState(() {
                Tarefas = [];
              });
              _textEditingController.clear(); //Limpar apos escrever
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
