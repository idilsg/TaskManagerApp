import 'package:flutter/material.dart';
import 'package:taskmanagerapp/pages/login.dart';
import 'package:taskmanagerapp/pages/tasks.dart';
import 'package:taskmanagerapp/pages/taskdetails.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Performanz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TaskDetailsPage(), // test için değiştiriyorum, sonra burayı düzelt
    );
  }
}
