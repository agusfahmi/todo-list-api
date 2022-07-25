// import 'package:aplikasi_tugas/pages/menu.dart';
// import 'package:aplikasi_tugas/provider/todo_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../components/crud_todo.dart';
// import '../provider/todo_provider.dart';
// import '../pages/LoginPage.dart';
//
// class halamanUtama extends StatefulWidget {
//   const halamanUtama({Key? key}) : super(key: key);
//
//   @override
//   _halamanUtamaState createState() => _halamanUtamaState();
// }
//
// class _halamanUtamaState extends State<halamanUtama> {
//   bool isDark = false;
//
//   saveToLocalStorage() async{
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setBool('isDark', isDark);
//   }
//
//   getLocalData() async {
//     final prefs = await SharedPreferences.getInstance();
//     isDark = prefs.getBool('isDark') ?? false;
//     setState(() {
//
//     });
//   }
//   static int counter=0;
//   void increment(){
//     setState(() {
//       counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: isDark
//           ? const Color(0xFF000000)
//           : const Color(0xFFFFFFFF),
//       drawer: menu(),
//       appBar: AppBar(
//         actions: <Widget>[
//           IconButton(icon: new Icon(Icons.dark_mode) , onPressed: () async{
//             isDark = !isDark;
//             saveToLocalStorage();
//             setState(() {
//             });
//           },
//           ),
//           IconButton(icon: new Icon(Icons.login), onPressed: () async{
//             final hasil = await Navigator.of(context).push(
//                 MaterialPageRoute(builder: (_) => LoginPage())
//             );
//           },
//           ), ],
//       ),
//       body: Consumer<todo_provider>(builder: (context, todoProvider, child) {
//         return ListView(
//           padding: const EdgeInsets.all(20.0),
//           children: todoProvider.todoList.isNotEmpty
//               ? todoProvider.todoList.map((todo) {
//             return Dismissible(
//               key: Key(todo.id),
//               background: Container(
//                 color: Colors.red.shade300,
//                 child: const Center(
//                   child: Text(
//                     "Hapus?",
//                       style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//               child: Card(
//                 shadowColor: Colors.grey,
//                 color: Colors.white,
//                 elevation: 10,
//                 child: ListTile(
//                   title: Text(todo.title),
//                   onTap: () {
//                     showDialog(
//                         context: context,
//                         builder: (context) {
//                           return crud_todo(
//                             title: "Edit Todo",
//                             todo: todo,
//                           );
//                         });
//                   },
//                 ),
//               ),
//               onDismissed: (direction) {
//                 Provider.of<todo_provider>(context, listen: false)
//                     .removeTodo(todo);
//               },
//             );
//           }).toList()
//               : [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height - 100.0,
//               child: const Center(
//                 child: Text(
//                   "Todo list masih kosong!",
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             )
//           ],
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           increment();
//           showDialog(
//               context: context,
//               builder: (context) {
//                 return const crud_todo(title: "Tambah Todo");
//               });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
