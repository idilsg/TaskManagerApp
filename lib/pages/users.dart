import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = [
      {'name': 'Admin User', 'isAdmin': true, 'profileUrl': 'https://m.media-amazon.com/images/I/41ONa5HOwfL.jpg'},
      {'name': 'User 2', 'isAdmin': false, 'profileUrl': 'https://m.media-amazon.com/images/I/31Cd9UQp6eL._AC_UF1000,1000_QL80_.jpg'},
      {'name': 'User 3', 'isAdmin': false, 'profileUrl': 'https://m.media-amazon.com/images/I/31jPSK41kEL.jpg'},
      {'name': 'User 4', 'isAdmin': false, 'profileUrl': 'https://m.media-amazon.com/images/I/41mSIgdsHvL._AC_UF1000,1000_QL80_.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kullanıcılar'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 24.0,
          bottom: 16.0,
          left: 8.0,
          right: 12.0,
        ),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final profileUrl = user['profileUrl'] as String? ?? '';
        
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (user['isAdmin'] == true)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset('assets/icons/admincrown.svg', width: 20, height: 20),
                    ),
                  CircleAvatar(
                    backgroundImage: profileUrl.isNotEmpty
                        ? NetworkImage(profileUrl)
                        : const AssetImage('assets/icons/default_profile.png') as ImageProvider,
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      user['name'] as String,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
