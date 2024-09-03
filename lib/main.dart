import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taskmanagerapp/pages/loginpage.dart';
import 'package:taskmanagerapp/pages/taskspage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TasksPage(), // test için değiştiriyorum, sonra burayı düzelt
    );
  }
}
