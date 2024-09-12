import 'package:flutter/material.dart';

class TaskDetailsWidget extends StatelessWidget {
  final String taskName;
  final String deadline;
  final String priority;

  const TaskDetailsWidget({
    super.key,
    required this.taskName,
    required this.deadline,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    Color priorityColor;

    // Öncelik durumuna göre renk belirleme
    if (priority == 'Yüksek') {
      priorityColor = Colors.red;
    } else if (priority == 'Orta') {
      priorityColor = Colors.orange;
    } else {
      priorityColor = Colors.green;
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Görev ismi
          Text(
            taskName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Bitiş tarihi
          Text(
            'Bitiş Tarihi: $deadline',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16),
          // Öncelik
          Row(
            children: [
              const Text(
                'Öncelik: ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                priority,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: priorityColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
