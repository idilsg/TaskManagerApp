import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanagerapp/pages/login.dart';
import 'package:taskmanagerapp/pages/tasks.dart';
import 'package:taskmanagerapp/pages/profile.dart';
import 'package:taskmanagerapp/pages/users.dart';
import 'package:taskmanagerapp/pages/addedittask.dart';
import 'package:taskmanagerapp/pages/taskdetails.dart';
import 'package:taskmanagerapp/pages/timeline.dart';

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
      home: const LoginPage(), // test için değiştiriyorum, sonra burayı düzelt
    );
  }
}
