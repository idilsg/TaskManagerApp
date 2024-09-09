import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';

// görev detaylarından düzenleye girince açılacak görev düzenleme sayfası
// seçtiğin görevin bilgileri gözükecek. üstüne düzenleme yapabileceksin

class EditTaskPage extends StatelessWidget {
  const EditTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Task Details'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TaskName(),
            SizedBox(height: 16),
            TaskDescription(),
          ],
        ),
      ),
    );
  }
}

class TaskName extends StatelessWidget {
  const TaskName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child:Text(
            'Görev İsmi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            //color: Colors.white,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: 'Görev ismini yazınız',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14
              )
            ),
            maxLines: 1,
          ),
        )
      ],
    );
  }
}

class TaskDescription extends StatelessWidget {
  const TaskDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child:Text(
            'Görev Açıklaması',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            //color: Colors.white,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              hintText: 'Görev açıklamasını yazınız',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14
              )
            ),
            maxLines: 4,
          ),
        )
      ],
    );
  }
}