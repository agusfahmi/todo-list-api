import 'package:flutter/material.dart';

import '../../models/todo_model.dart';
import '../../utils/TodoServices.dart';
import '../../widgets/widget_info.dart';

class TodoEditPage extends StatefulWidget {
  const TodoEditPage({Key? key, required this.todoModel}) : super(key: key);

  final TodoModel todoModel;

  @override
  State<TodoEditPage> createState() => _TodoEditPage();
}

class _TodoEditPage extends State<TodoEditPage> {
  final TodoService service = TodoService();

  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // judulController.text = widget.email.judul!;
    // isiController.text = widget.email.isi!;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 23,
          color: Colors.black54,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Ganti Todo',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        actions: [

          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 20,
            color: Colors.black54,
            onPressed: () {
              if (todoController.text.isEmpty ) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const InfoWidget(
                        title: "Informasi!", content: "Lengkapi data todo!!!");
                  },
                );
              } else {
                service.updateTodo(widget.todoModel.id!, TodoModel(
                  title : todoController.text.trim(),
                  id: '',
                ));

                Navigator.pop(context);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Todo berhasil diupdate!"),
                ));
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    const SizedBox(width: 15.0),
                    // Text(
                    //   widget.email.pengirim!,
                    //   style: const TextStyle(
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.3,
              color: Colors.black.withOpacity(0.2),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    // Text(
                    //   "Ganti: ",
                    //   style: TextStyle(
                    //     color: Colors.black.withOpacity(0.5),
                    //     fontSize: 15,
                    //   ),
                    // ),
                    const SizedBox(width: 15.0),
                    // Text(
                    //   widget.email.penerima!,
                    //   style: const TextStyle(
                    //     fontSize: 15,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.3,
              color: Colors.black.withOpacity(0.2),
            ),
            TextField(
              controller: todoController,
              style: const TextStyle(
                fontSize: 15,
              ),
            //   decoration: const InputDecoration(
            //     border: InputBorder.none,
            //     contentPadding: EdgeInsets.only(
            //       top: 15,
            //       left: 10,
            //       right: 10,
            //     ),
            //   ),
            // ),
            )],
        ),
      ),
    );
  }
}
