import 'package:aplikasi_tugas/pages/SignupPage.dart';
import 'package:aplikasi_tugas/pages/halamanUtama.dart';
import 'package:aplikasi_tugas/pages/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:aplikasi_tugas/pages/welcome_user.dart';
import 'package:aplikasi_tugas/components/dummy_data.dart';
import 'package:aplikasi_tugas/pages/welcomeGoogle.dart';
import 'package:aplikasi_tugas/components/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameControl = new TextEditingController();
  TextEditingController passwordControl = new TextEditingController();
  late int idUser = 0 ;
  GoogleSignInAccount? _userObj;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  String url = "";
  String name = "";
  String password = "";
  String email = "";
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isloading = false;


  @override
  void initState() {
      getData();
      super.initState();
  }
  static int counter=0;
  void increment(){
    setState(() {
      counter++;
    });
  }

  void cekLogin(){
    for(int i=0;i< DummyData.data.length; i++){
      if(usernameControl.text.contains(DummyData.data[i]['username']) && passwordControl.text.contains(DummyData.data[i]['password'])) {
        saveToLocal(DummyData.data[i]['id']);
         initState();
      }
    }
  }

  saveToLocal(int id) async{
      final prefer = await SharedPreferences.getInstance();
      await prefer.setInt('id', id);
  }

  Future getData() async {
      final prefer = await SharedPreferences.getInstance();
      idUser = prefer.getInt('id')!;
      if(idUser != 0){
        login();
      }
  }

  void login(){
    Fluttertoast.showToast(
      msg: "Login Sukses",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
    );
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const welcome_user()));
  }


  Future<bool> signIn() async{
    try{
      await _googleSignIn.signIn();
      return true;
    }on FirebaseAuthException catch (e){
      debugPrint(e.message ?? "Unkwon Error");
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/images/logo.png'),
        ),
    );

    final usernameForm = TextFormField(
      controller: usernameControl,
      onChanged: (value) {
        email = value.toString().trim();
      },
      validator: (value) => (value!.isEmpty)
          ? ' Please enter email'
          : null,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final passwordForm = TextFormField(
      controller: passwordControl,
      autofocus: false,
      obscureText: true,
      validator: (value){
        if(value!.isEmpty){
          return "Masukkan Password";
        }
      },
      onChanged: (value) {
        password = value;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final LoginGoogleButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        onPressed: () {
          _googleSignIn.signIn().then((userData) {
            setState(() {
              _userObj = userData;
              url = _userObj!.photoUrl.toString();
              name = _userObj!.displayName.toString();
              email = _userObj!.email;
            });
            if (userData != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => (second(
                    url: url,
                    name: name,
                    email: email,
                  )),
                ),
              );
            }
          }).catchError((e) {
            print(e);
          });
        },
        child: Text('Log In with google', style: TextStyle(color: Colors.white),
        ),
      ),
    );



    final lupaPassword = FlatButton(
      child: Text(
        'Lupa Password?', style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        // Navigator.of(context).;
      },
    );


    return Scaffold(
      backgroundColor: Colors.white,
      drawer: menu(),
      appBar: AppBar(),
      body: Form(
        key: formkey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48),
            usernameForm,
            SizedBox(height: 8.0),
            passwordForm,
            SizedBox(height: 24.0),
            LoginSignupButton(
              title: 'Login',
              ontapp: () async {
                if (formkey.currentState!.validate()) {
                  setState(() {
                    isloading = true;
                  });
                  try {
                    await _auth.signInWithEmailAndPassword(
                        email: email, password: password);

                    // await Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (contex) => halamanUtama(),
                    //   ),
                    // );

                    setState(() {
                      isloading = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Ops! Login Failed"),
                        content: Text('${e.message}'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(ctx).pop();
                            },
                            child: Text('Okay'),
                          )
                        ],
                      ),
                    );
                    print(e);
                  }
                  setState(() {
                    isloading = false;
                  });
                }else{
                  print('kesalahan');
                }
              },
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SignupPage(),
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    "\nTidak punya akun ?",
                    style: TextStyle(
                        fontSize: 20, color: Colors.black87),
                  ),
                  SizedBox(width: 10),
                  Hero(
                    tag: '1',
                    child: Text(
                      '\nSign up',
                      style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            LoginGoogleButton,
            lupaPassword
          ],
        ),
      )

    );
  }
}