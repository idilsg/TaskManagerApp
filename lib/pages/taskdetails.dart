import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';
import 'package:taskmanagerapp/widgets/taskdetailsw.dart';

class TaskDetailsPage extends StatelessWidget {
  final String taskName;
  final String deadline;
  final String priority;

  const TaskDetailsPage({
    super.key,
    required this.taskName,
    required this.deadline,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Görev Detayları'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/threedot.svg',
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/edittask');
            },
          ),
        ],
      ),
      body: TaskDetailsWidget(
        taskName: taskName,
        deadline: deadline,
        priority: priority,
      ),
      bottomNavigationBar: const BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}
