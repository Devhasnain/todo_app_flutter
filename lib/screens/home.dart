import 'package:flutter/material.dart';
import '../models/todo.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var todosList = Todo.todoList();
  final _inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: _buildAppBar(),
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _filterList(value),
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                        ),
                        prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(color: Colors.grey)),
                  )),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(vertical: 35),
                child: ListView(
                  children: [
                    const Text(
                      "Todo list",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    for (Todo todo in todosList.reversed)
                      TodoItem(
                        todo: todo,
                        handleDone: _handleDone,
                        handleDelete: _handleDelete,
                      ),
                  ],
                ),
              )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.white54,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: _inputController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        border: InputBorder.none,
                        hintText: "Add todo here...",
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  onPressed: () {
                    _addItem(_inputController.text);
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  void _handleDone(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleDelete(int id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addItem(String todo) {
    if(todo.length > 1){
    setState(() {
      todosList
          .add(Todo(id: DateTime.now().microsecond, text: todo, isDone: false));
    });
    _inputController.clear();
    }

  }

  void _filterList(String text) {
    // List<Todo> results = [];
    // if (text.isEmpty) {
    //   results = todosList;
    // } else {
    //   results = todosList
    //       .where((element) =>
    //           element.text!.toLowerCase().contains(text.toLowerCase()))
    //       .toList();
    // }
    // setState(() {
    //   todosList = results;
    // });
  }
}

AppBar _buildAppBar() {
  return AppBar(
      backgroundColor: Colors.lightBlue,
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            size: 30,
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
        ],
      ));
}
