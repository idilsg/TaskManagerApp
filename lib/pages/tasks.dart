import 'package:flutter/material.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';
import 'package:taskmanagerapp/widgets/taskbox.dart';

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
        automaticallyImplyLeading: false,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TaskBox(
              taskName: 'Görev 1',
              deadline: '14 Eylül 2024',
              priority: 'Yüksek',
              progress: 0.25,
            ),
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 2',
              deadline: '21 Eylül 2024',
              priority: 'Orta',
              progress: 0.50,
            ),
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 3',
              deadline: '30 Eylül 2024',
              priority: 'Düşük',
              progress: 0.75,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(selectedIndex: 0),
    );
  }
}
