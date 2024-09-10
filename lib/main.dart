import 'package:flutter/material.dart';
import 'package:taskmanagerapp/pages/edittask.dart';
//import 'package:taskmanagerapp/pages/login.dart';
import 'package:taskmanagerapp/pages/tasks.dart';

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
      // home: const EditTaskPage(), // test için değiştiriyorum, sonra burayı düzelt
      initialRoute: '/',
      routes: {
        '/': (context) => const EditTaskPage(),
        '/tasks': (context) => const TasksPage(),
      },
    );
  }
}
