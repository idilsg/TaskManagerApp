import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/models/userinfos.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          left: 4.0,
          right: 12.0,
        ),
        child: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
        
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (user.isAdmin)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset('assets/icons/admincrown.svg', width: 20, height: 20),
                    ),
                  CircleAvatar(
                    backgroundImage: user.profileUrl.isNotEmpty
                      ? NetworkImage(user.profileUrl)
                      : const AssetImage('assets/icons/default_profile.png') as ImageProvider,
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      user.name,
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
