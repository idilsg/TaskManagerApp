import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/pages/tasks.dart';
import 'package:taskmanagerapp/pages/addtask.dart';
import 'package:taskmanagerapp/pages/profile.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;

  const BottomBar({
    super.key, 
    this.selectedIndex = 0
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _iconButton(context, 'assets/icons/tasksicon.svg', 0, const TasksPage()),
          _iconButton(context, 'assets/icons/pluswithborder.svg', 1, const AddTaskPage()),
          _iconButton(context, 'assets/icons/profilepage.svg', 2, const ProfilePage()),
        ],
      ),
    );
  }

  Widget _iconButton(BuildContext context, String assetName, int index, Widget targetScreen) {
    return IconButton(
      icon: SvgPicture.asset(
        assetName,
        height: 32.0,
        width: 32.0,
        // colorFilter: const ColorFilter.mode(Color(0xFFF5F5F7), BlendMode.srcIn),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
    );
  }
}
