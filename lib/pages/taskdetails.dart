import 'package:flutter/material.dart';
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
        // geri tuşu ve düzenleme tuşu gelecek
      ),
      body: const Center(
        child: Text('burada görev detayları olacak'),
      ),
      bottomNavigationBar: const BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}