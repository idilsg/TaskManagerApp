import 'package:flutter/material.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';

// adminlerde değişiklikler olacak

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tasks'),
      ),
      body: Center(
        child: Text('burada görevler olacak'),
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: 0, // tasks ikonu seçili
      ),
    );
  }
}
