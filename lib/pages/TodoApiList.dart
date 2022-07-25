import 'package:aplikasi_tugas/pages/LoginPage.dart';
import 'package:aplikasi_tugas/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'crud/TodoAddPage.dart';
import 'crud/TodoDetailPage.dart';

class TodoApiList extends StatefulWidget {
  const TodoApiList({Key? key, this.todomodel}) : super(key: key);
  final List<TodoModel>? todomodel;

  @override
  State<TodoApiList> createState() => _TodoApiListState();
}

class _TodoApiListState extends State<TodoApiList> {
  @override
    Widget build(BuildContext context) {
    List<TodoModel> listReversed = widget.todomodel!.reversed.toList();
    bool isDark = false;

    saveToLocalStorage() async{
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDark', isDark);
    }

    getLocalData() async {
      final prefs = await SharedPreferences.getInstance();
      isDark = prefs.getBool('isDark') ?? false;
      setState(() {

      });
    }

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF000000)
          : const Color(0xFFFFFFFF),
      drawer: menu(),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: new Icon(Icons.dark_mode) , onPressed: () async{
            isDark = !isDark;
            saveToLocalStorage();
              setState(() {

              });
            },
          ),
          IconButton(icon: new Icon(Icons.login), onPressed: () async{
            final hasil = await Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => LoginPage())
            );
          },
          ), ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              // child: RichText(
              //   // text: TextSpan(
              //   //     style: const TextStyle(color: Colors.black),
              //   //     text: 'Halo  ',
              //   //     children: [
              //   //       TextSpan(
              //   //         text: "fahmi@gmail.com",
              //   //         style: const TextStyle(
              //   //           color: Colors.blue,
              //   //           fontWeight: FontWeight.bold,
              //   //         ),
              //   //       )
              //   //     ]),
              // ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 20),

            ),
            Expanded(
              child: ListView.builder(
                itemCount: listReversed == null ? 0 : listReversed.length,
                itemBuilder: (BuildContext context, int index) {
                  return Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TodoDetailPage(todoModel : listReversed[index])),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 7,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 20.0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Icon(Icons.check),
                                      ),
                                    ),
                                    const SizedBox(width: 15),
                                    Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            // Text(
                                            //   listReversed[index].pengirim!,
                                            //   style: const TextStyle(
                                            //       fontWeight: FontWeight.bold,
                                            //       fontSize: 15,
                                            //       color: Colors.black),
                                            //   maxLines: 1,
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                            Text(
                                              listReversed[index].title!,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            // Text(
                                            //   listReversed[index].isi!,
                                            //   style: const TextStyle(
                                            //       fontSize: 12,
                                            //       color: Colors.black),
                                            //   maxLines: 1,
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                          ],
                                        ))
                                  ],
                                )),
                            const Expanded(
                              flex: 1,
                              child: SizedBox(width: 15),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 5),
                                  // Text(
                                  //     listReversed[index].tanggal!,
                                  //     style: const TextStyle(
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 12,
                                  //         color: Colors.black)),
                                  const SizedBox(height: 5),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TodoAddPage()),
          );
        },
        label: const Text("Tambah Todo"),
        icon: const Icon(Icons.mode_edit),
        // backgroundColor: Color.fromRGBO(195, 231, 255, 1),
      ),

    );
  }
}
