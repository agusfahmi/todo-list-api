import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:aplikasi_tugas/pages/LoginPage.dart';
import 'package:aplikasi_tugas/components/dummy_data.dart';

class welcome_user extends StatefulWidget {
  const welcome_user({Key? key}) : super(key: key);

  @override
  _welcome_userState createState() => _welcome_userState();
}

class _welcome_userState extends State<welcome_user>{
  //String email = "";
  bool isLight = true;

  late int idUser = 0;
  Widget _namaUser = const Text('Hello!');

  saveToLocalStorage() async {
    final prefis = await SharedPreferences.getInstance();
    await prefis.setBool('isLight', isLight);
  }
  getLocalData() async {
    final prefer = await SharedPreferences.getInstance();
    idUser = prefer.getInt('id')!;
    ambilData();
    setState(() {
    });
  }

  void ambilData(){
    for(int i = 0; i< DummyData.data.length; i++){
      if(idUser == (DummyData.data[i]['id'])){
        _namaUser = Text(DummyData.data[i]['nama']);
      }
    }
  }

  Future clearLogin()  async{
    final prefer = await SharedPreferences.getInstance();
    await prefer.setInt('id', 0);
    idUser = prefer.getInt('id')!;
  }

  void Logout() {
    clearLogin();
    if(idUser == 0){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }


  @override
  void initState() {
    getLocalData();
    super.initState();
    // getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome User'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: _namaUser ,
          ),
          SizedBox(height: 20,),
          MaterialButton(
            color: Colors.red,
            onPressed: Logout,
            child: Text("Log Out",style: TextStyle(color: Colors.white),),),
        ],
      ),
    );
  }
}
