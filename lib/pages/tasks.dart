import 'package:flutter/material.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';

// adminlerde değişiklikler olacak

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
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
