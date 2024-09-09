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
            SizedBox(height: 16), // buraya takvim gelecek
            TaskPriority(),
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

class TaskPriority extends StatefulWidget {
  const TaskPriority({super.key});

  @override
  _TaskPriorityState createState() => _TaskPriorityState();
}

class _TaskPriorityState extends State<TaskPriority> {
  int selectedIndex = -1; // başlangıçta hiçbir seçenek seçilmemiş olacak

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
          child: Text(
            'Öncelik',
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
          child: Row(
            children: List.generate(3, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // seçilen indeks güncelleniyor
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? Color(0xFFE47000).withOpacity(0.6) // seçilen butonun rengi
                          : Colors.white, // seçilmeyen butonun rengi
                      borderRadius: index == 0
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            )
                          : index == 2
                              ? const BorderRadius.only(
                                  topRight: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                )
                              : null,
                    ),
                    child: Center(
                      child: Text(
                        ['Düşük', 'Orta', 'Yüksek'][index],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
