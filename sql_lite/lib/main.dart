import 'package:flutter/material.dart';
import 'package:sql_lite/pages/login_page.dart';

void main() {
  //adb connect 127.0.0.1:62001 -- NOX
  //adb connect 127.0.0.1:21503 -- MEMU
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Prueba1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
  
}