import 'package:flutter/material.dart';
import 'package:new_project/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final handleDone;
  final handleDelete;
  const TodoItem({super.key, required this.todo, required this.handleDone, required this.handleDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        onTap: () {
          handleDone(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ?
          Icons.check_box : Icons.check_box_outline_blank,
          size: 20,
          color: Colors.blue,
        ),
        title: Text(
          todo.text ?? "",
          style:
               TextStyle(fontSize: 17, decoration:
                  todo.isDone ?
              TextDecoration.lineThrough : null
              ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            onPressed: (){
              handleDelete(todo.id);
            },
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(
              Icons.delete,
            ),
          ),
        ),
      ),
    );
  }
}
