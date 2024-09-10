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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/taskdetails');
              },
              child: Container(
                height: 100, 
                width: double.infinity, 
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0), 
                ),
                child: const Center(
                  child: Text(
                    'Görev Örneği',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(
        selectedIndex: 0,
      ),
    );
  }
}
