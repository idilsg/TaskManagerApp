import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/pages/tasks.dart';
import 'package:taskmanagerapp/pages/addedittask.dart';
import 'package:taskmanagerapp/pages/timeline.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;

  const BottomBar({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildIconButton(context, 'assets/icons/tasksicon.svg', 0, TasksPage()),
          _buildIconButton(context, 'assets/icons/pluswithborder.svg', 1, AddEditTaskPage()),
          _buildIconButton(context, 'assets/icons/timelineicon.svg', 2, TimelinePage()),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, String assetName, int index, Widget targetScreen) {
    return IconButton(
      icon: SvgPicture.asset(assetName,),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetScreen),
        );
      },
    );
  }
}
