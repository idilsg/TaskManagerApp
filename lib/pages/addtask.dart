import 'package:flutter/material.dart';

// görev ekleme sayfası, bottom bar'daki ikinci sayfa

class AddTaskPage extends StatelessWidget {
  const AddTaskPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Add Task'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: const Center(
        child: Text('burada görev ekleme olacak'),
      ),
    );
  }
}