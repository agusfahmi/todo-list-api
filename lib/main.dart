import 'package:aplikasi_tugas/widgets/load_data.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'models/notification_handler.dart';
import 'provider/todo_provider.dart';
import 'pages/halamanUtama.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeNotification();
  debugPrint("token www: ${(await FirebaseMessaging.instance.getToken()).toString()}");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
     providers: [
       ChangeNotifierProvider(
           create: (context) => todo_provider(),
       ),
     ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Aplikasi Tugas",
        home: LoadData(),
      ),
    );
  }
}
