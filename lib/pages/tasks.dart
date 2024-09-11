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
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          bottom: 16.0,
          left: 24.0,
          right: 24.0,
        ),
        child: ListView(
          children: const [
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
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 4',
              deadline: '5 Ekim 2024',
              priority: 'Yüksek',
              progress: 0.60,
            ),
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 5',
              deadline: '14 Eylül 2024',
              priority: 'Yüksek',
              progress: 0.25,
            ),
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 6',
              deadline: '21 Eylül 2024',
              priority: 'Orta',
              progress: 0.50,
            ),
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 7',
              deadline: '30 Eylül 2024',
              priority: 'Düşük',
              progress: 0.75,
            ),
            SizedBox(height: 16),
            TaskBox(
              taskName: 'Görev 8',
              deadline: '5 Ekim 2024',
              priority: 'Yüksek',
              progress: 0.60,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(selectedIndex: 0),
    );
  }
}
