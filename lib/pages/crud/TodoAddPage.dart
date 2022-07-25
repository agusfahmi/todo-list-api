import 'package:aplikasi_tugas/pages/LoginPage.dart';
import 'package:aplikasi_tugas/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';
import 'package:aplikasi_tugas/utils/TodoServices.dart';
import '../../widgets//widget_info.dart';

class TodoAddPage extends StatefulWidget {
  const TodoAddPage({Key? key}) : super(key: key);

  @override
  State<TodoAddPage> createState() => _TodoAddPage();
}

class _TodoAddPage extends State<TodoAddPage> {
  _TodoAddPage();
  bool isDark = false;
  final TodoService service = TodoService();
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      drawer: menu(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.dark_mode) , onPressed: () async{
            isDark = !isDark;
            // saveToLocalStorage();
            // setState(() {
            // });
          },
          ),
          // IconButton(icon: new Icon(Icons.login), onPressed: () async{
          //   final hasil = await Navigator.of(context).push(
          //       MaterialPageRoute(builder: (_) => LoginPage())
          //   );
          // },
          //
          // ),
          IconButton(
            icon: const Icon(Icons.send),
            iconSize: 20,
            color: Colors.white,
            onPressed: () async {
              if (todoController.text.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const InfoWidget(
                        title: "Informasi!", content: "Lengkapi data !!!");
                  },
                );
              // } else if (!RegExp(
              //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              //     .hasMatch(namaController.text)) {
              //   showDialog(
              //     context: context,
              //     builder: (context) {
              //       return const InfoWidget(
              //           title: "Informasi!", content: "Data tidak valid!!!");
              //     },
              //   );
              //
                } else {


                var now = DateTime.now();
                var formatter = DateFormat('dd MMM');
                String formattedDate = formatter.format(now);

                service.sendTodo(
                  TodoModel(
                    title: todoController.text,
                  ),
                );

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Todo berhasil ditambahkan!"),
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
                      // Text(
                      //   "Dari",
                      //   style: TextStyle(
                      //     color: Colors.black.withOpacity(0.5),
                      //     fontSize: 15,
                      //   ),
                      // ),
                      const SizedBox(width: 15.0),
                      // Text(
                      //   '${user.email}',
                      //   style: const TextStyle(
                      //     fontSize: 15,
                      //   ),
                      // ),
                    ],
                  ),
                )),
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
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  top: 15,
                  left: 10,
                  right: 10,
                ),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Text(
                    'Nama Todo',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                    ),
                  ),
                ),
                // suffixIcon: IconButton(
                //   icon: const Icon(Icons.expand_more),
                //   color: Colors.black54,
                //   onPressed: () {},
                // ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 0.3,
              color: Colors.black.withOpacity(0.2),
            ),
            // TextField(
            //   controller: todoController,
            //   style: const TextStyle(
            //     fontSize: 15,
            //   ),
            //   decoration: const InputDecoration(
            //     border: InputBorder.none,
            //     contentPadding: EdgeInsets.only(
            //       top: 15,
            //       left: 10,
            //       right: 10,
            //     ),
            //     prefixIcon: Padding(
            //       padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            //       child: Text(
            //         'Subjek',
            //         style: TextStyle(
            //           color: Colors.black54,
            //           fontSize: 15,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   width: double.infinity,
            //   height: 0.3,
            //   color: Colors.black.withOpacity(0.2),
            // ),
            // TextField(
            //   maxLines: null,
            //   controller: isiController,
            //   style: const TextStyle(
            //     fontSize: 15,
            //   ),
            //   decoration: const InputDecoration(
            //     border: InputBorder.none,
            //     contentPadding: EdgeInsets.all(15),
            //     hintText: 'Tulis Email',
            //     enabledBorder: InputBorder.none,
            //     disabledBorder: InputBorder.none,
            //   ),
            // ),
           // ),
          ],
        ),
      ),
    );
  }
}
