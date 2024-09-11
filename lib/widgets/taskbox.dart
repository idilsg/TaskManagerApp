import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TaskBox extends StatelessWidget {
  final String taskName;
  final String deadline;
  final String priority;
  final double progress;

  const TaskBox({
    super.key,
    required this.taskName,
    required this.deadline,
    required this.priority,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    Color priorityColor;

    if (priority == 'Yüksek') {
      priorityColor = Colors.red;
    } else if (priority == 'Orta') {
      priorityColor = Colors.orange;
    } else {
      priorityColor = Colors.green;
    }

    return GestureDetector(
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    taskName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Bitiş Tarihi: $deadline',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Text(
                        'Öncelik: ',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        priority,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: priorityColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 4.0,
                percent: progress,
                center: Text('${(progress * 100).toInt()}%'),
                progressColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
