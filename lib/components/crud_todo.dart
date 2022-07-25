// import 'package:aplikasi_tugas/models/todo_model.dart';
// import 'package:flutter/material.dart';
// import 'package:uuid/uuid.dart';
// import 'package:aplikasi_tugas/components/info_widget.dart';
// import 'package:provider/provider.dart';
// import 'package:aplikasi_tugas/provider/todo_provider.dart';
//
// class crud_todo extends StatelessWidget {
//   final String title;
//   final TodoModel? todo;
//   const crud_todo({
//     Key? key,
//     required this.title,
//     this.todo,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     TextEditingController _todoController = TextEditingController();
//
//     if(todo != null){
//       _todoController.text = todo!.title;
//     }
//     return AlertDialog(
//       title: Text('Input Todo'),
//       content: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(
//               controller: _todoController,
//               textCapitalization: TextCapitalization.sentences,
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 filled: true,
//                 isDense: true,
//                 fillColor: Colors.grey.shade100,
//                 labelText: "Todo",
//                 hintText: "Masukkan Todo"
//               ),
//             )
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(
//             onPressed: () {
//           Navigator.pop(context);
//           }, child: const Text("Batal"),
//         ),
//         TextButton(onPressed: () {
//           if(_todoController.text.isEmpty){
//             showDialog(
//                 context: context,
//                 builder: (context) {
//                   return const InfoWidget(title: "Eror", content: "Tidak boleh kosong");
//                 },
//             );
//           } else {
//             if(todo != null){
//               Provider.of<todo_provider>(context, listen: false)
//                   .updateTodo(
//                 TodoModel(
//                   title: _todoController.text,
//                   // isDone: false,
//                   id: todo!.id,
//                 )
//               );
//             }else{
//             const uuid = Uuid();
//
//             Provider.of<todo_provider>(context, listen: false).addTodo(
//               TodoModel(
//                 title:_todoController.text ,
//                 // isDone: false,
//                 id: uuid.v4(),)
//             );
//             }
//             Navigator.pop(context);
//           }
//           }, child: const Text("Simpan"),
//         ),
//       ],
//     );
//   }
// }
