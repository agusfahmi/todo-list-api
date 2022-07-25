import 'package:aplikasi_tugas/models/data.dart';
import 'package:aplikasi_tugas/models/user.dart';
import 'package:aplikasi_tugas/utils/dio_client.dart';
import 'package:aplikasi_tugas/widgets/create_user.dart';
import 'package:aplikasi_tugas/widgets/fetch_user.dart';
import 'package:aplikasi_tugas/widgets/update_user.dart';
import 'package:flutter/material.dart';

class Api_Test extends StatefulWidget {
  @override
  _Api_TestState createState() => _Api_TestState();
}

class _Api_TestState extends State<Api_Test> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'POST',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CreateUser(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  'GET & DELETE',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FetchUser(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'UPDATE',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              UpdateUser(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  'GET (auto fetch)',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: FutureBuilder<User?>(
                  future: _client.getUser(id: '1'),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      User? userInfo = snapshot.data;

                      if (userInfo != null) {
                        Data userData = userInfo.data;

                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(userData.avatar),
                            SizedBox(height: 8.0),
                            Text(
                              '${userInfo.data.firstName} ${userInfo.data.lastName}',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            Text(
                              userData.email,
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ],
                        );
                      }
                    }
                    return CircularProgressIndicator();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
