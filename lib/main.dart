import 'package:flutter/material.dart';
import 'package:taskmanagerapp/pages/edittask.dart';
import 'package:taskmanagerapp/pages/taskdetails.dart';
import 'package:taskmanagerapp/pages/login.dart';
import 'package:taskmanagerapp/pages/tasks.dart';
import 'package:taskmanagerapp/pages/addtask.dart';
import 'package:taskmanagerapp/pages/profile.dart';
import 'package:taskmanagerapp/pages/users.dart';
import 'package:taskmanagerapp/pages/taskfilter.dart';
import 'package:taskmanagerapp/pages/edituser.dart';

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
      // home: const EditTaskPage(), // test için değiştiriyorum, login olacak
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(), // login olacak
        '/tasks': (context) => const TasksPage(),
        '/taskdetails': (context) => const TaskDetailsPage(),
        '/addtask': (context) => const AddTaskPage(),
        '/edittask': (context) => const EditTaskPage(),
        '/profile': (context) => const ProfilePage(),
        '/users': (context) => const UsersPage(),
        '/taskfilter': (context) => const TaskFilterPage(),
        '/edituser': (context) => const EditUserPage(),
        '/login': (context) => const LoginPage(),
      },
    );
  }
}
