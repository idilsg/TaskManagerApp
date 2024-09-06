import 'package:flutter/material.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';

// profil sayfası, bottom bar'daki üçüncü sayfa

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: const Center(
        child: Text('burada profil olacak'),
      ),
      bottomNavigationBar: const BottomBar(
        selectedIndex: 2,
      ),
    );
  }
}