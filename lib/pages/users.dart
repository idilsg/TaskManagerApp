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
        title: const Text('Users'),
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final profileUrl = user['profileUrl'] as String? ?? '';

          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (user['isAdmin'] == true)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SvgPicture.asset('assets/admincrown.svg', width: 20, height: 20),
                  ),
                CircleAvatar(
                  backgroundImage: profileUrl.isNotEmpty 
                      ? NetworkImage(profileUrl)
                      : AssetImage('assets/default_profile.png') as ImageProvider,
                  radius: 20,
                ),
              ],
            ),
            title: Text(user['name'] as String),
          );
        },
      ),
    );
  }
}
