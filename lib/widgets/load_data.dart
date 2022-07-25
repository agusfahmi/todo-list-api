import 'package:flutter/material.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';
import 'package:aplikasi_tugas/pages/TodoApiList.dart';
import 'package:aplikasi_tugas/utils/TodoServices.dart';
class LoadData extends StatefulWidget {
  const LoadData({Key? key}) : super(key: key);

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  final TodoService service = TodoService();
  List<TodoModel>? todoList;

  @override
  Widget build(BuildContext context) {
    if(todoList == null) {
      todoList = List<TodoModel>.empty();
    }
    return MaterialApp(
      home: FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return TodoApiList(todomodel: todoList);
          }
      ),
    );
  }

  Future loadList() {
    Future<List<TodoModel>> futureEmail = service.getTodo();
    futureEmail.then((todoList) {
      setState(() {
        this.todoList = todoList;
      });
    });

    print(futureEmail);

    return futureEmail;
  }
}
