import 'package:flutter/material.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';

// görevlerin  gözükebileceği, bottom bar'daki ilk sayfa
// adminlerde değişiklikler olacak

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Tasks'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: const Center(
        child: Text('burada görevler olacak'),
      ),
      bottomNavigationBar: const BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}
