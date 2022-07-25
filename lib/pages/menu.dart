import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_tugas/pages/ListUser.dart';
import 'package:aplikasi_tugas/pages/SignupPage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:aplikasi_tugas/models/todo_model.dart';
import 'package:aplikasi_tugas/provider/todo_provider.dart';
import 'package:aplikasi_tugas/pages/api_test.dart';
import 'package:aplikasi_tugas/pages/TodoApiList.dart';
import 'package:aplikasi_tugas/widgets/load_data.dart';

class menu extends StatelessWidget {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignIn? _userObj;
  String urlFoto = "";
  String url = "";
  String name = "";
  String password = "";
  String email = "";  // int count = ;

  Stream<String> get onAuthStateChanged => _firebaseAuth.authStateChanges().map(
        (User? user) => user!.uid,
  );


  // GET UID
  Future<String> getCurrentUID() async {
    return (_firebaseAuth.currentUser)!.uid;
  }

  // GET CURRENT USER
  Future getCurrentUser() async {
    return _firebaseAuth.currentUser;
  }
  getProfileImage() {
    if(_firebaseAuth.currentUser?.photoURL != null) {
      return Image.network(_firebaseAuth.currentUser?.photoURL?? "", height: 100, width: 100);
    } else {
      return Icon(Icons.account_circle, size: 100).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final countTodo = Provider.of<todo_provider>(context);
    int c = countTodo.todoList.length;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            margin: EdgeInsets.all(0),
            padding: EdgeInsets.all(0),
            child: Container(
                height: 510,
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(children: [
                Container(
                  height: 60,
                  width: 60,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(35),
                   child: Image.network(url),)),
                Container(
                  padding: EdgeInsets.only(top : 5),
                  child: Text("Bill Gates"),
                )
              ],),
            ),
          ),
          ListTile(
            leading: Icon(Icons.date_range),
            title: Text('Hari Saya'),
            onTap: () => {},
            trailing: Text(c.toString()),
          ),

          ListTile(
            leading: Icon(Icons.warning_amber_outlined),
            title: Text('Input Todo with API'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoadData()))},
          ),
          ListTile(
            leading: Icon(Icons.app_registration),
            title: Text('Rest API'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => Api_Test()))},
          ),
          ListTile(
            leading: Icon(Icons.all_inbox),
            title: Text('List User'),
            onTap: () => {Navigator.of(context).push(MaterialPageRoute(builder: (_) => ListUser(),),),},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
