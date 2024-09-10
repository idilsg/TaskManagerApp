import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';

// göreve basınca detayları çıkacak sayfa

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Task Details'),
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
      body: const Center(
        child: Text('Burada görev detayları olacak'),
      ),
      bottomNavigationBar: const BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}