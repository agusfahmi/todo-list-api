import 'dart:math';

import 'package:flutter/material.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';
import 'package:aplikasi_tugas/utils/TodoServices.dart';
import 'TodoEditPage.dart';

class TodoDetailPage extends StatefulWidget {
  TodoDetailPage({Key? key, required this.todoModel}) : super(key: key);
  final TodoModel todoModel;

  @override
  State<StatefulWidget> createState() => _TodoDetailPage();
}

class _TodoDetailPage extends State<TodoDetailPage> {
  _TodoDetailPage();

  final TodoService service = TodoService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            iconSize: 23,
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => TodoEditPage(todoModel: widget.todoModel)),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.delete),
            color: Colors.black,
            onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Peringatan!'),
                content:
                const Text('Apa anda yakin ingin menghapus todo ini ?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, 'Batal');
                    },
                    child: const Text('Batal'),
                  ),
                  TextButton(
                    onPressed: () {
                      service.deleteTodo(widget.todoModel.id!);
                      Navigator.pop(context, 'Hapus');
                      // Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Todo berhasil dihapus!"),
                      ));
                    },
                    child: const Text('Hapus'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Text(
                            widget.todoModel.title!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      Expanded(
                          flex: 1,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              ]
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(18),
                    // child: Text(
                    //   widget.to.isi!,
                    //   style: const TextStyle(fontSize: 12),
                    // ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
