import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:aplikasi_tugas/pages/LoginPage.dart';

class second extends StatefulWidget {
  String url;
  String name;
  String email;
  second({
    required this.url,
    required this.name,
    required this.email,
  });
  @override
  _secondState createState() => _secondState(
    url: url,
    name: name,
    email: email,
  );
}

class _secondState extends State<second> {
  String url;
  String name;
  String email;
  _secondState({
    required this.url,
    required this.name,
    required this.email,
  });
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Welcome User',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: CircleAvatar(
                radius: 50,
                child: Image.network(url),
              ),
           ),
            SizedBox(
              height: 20,
            ),
            Text(name),
            SizedBox(
              height: 10,
            ),
            Text(email),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                _googleSignIn.signOut().then((value) {
                  setState(() {});
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (LoginPage()),
                    ),
                  );
                }).catchError((e) {});
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}