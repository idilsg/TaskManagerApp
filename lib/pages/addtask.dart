import 'package:flutter/material.dart';
import 'package:taskmanagerapp/pages/tasks.dart';
import 'package:taskmanagerapp/widgets/bottombar.dart';
//import 'package:intl/intl.dart';

// düzenleme sayfasının boş hali olacak

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Görev Ekle'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 32, 
          right: 32,
          top: 16,
          bottom: 16
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TaskName(),
              const SizedBox(height: 16),
              const TaskDescription(),
              const SizedBox(height: 16),
              // buraya takvim gelecek
              // SizedBox(height: 16),
              const TaskPriority(),
              const SizedBox(height: 16),
              // buraya kategori gelecek
              // SizedBox(height: 16),
              // buraya kişiler gelecek
              // SizedBox(height: 16),
              const ProgressandStatus(),
              const SizedBox(height: 32), 
              addButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Center addButton(BuildContext context) {
    return Center(
            child: SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE47000), Colors.orange],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.5,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const TasksPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Ekle', 
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )
                  ),
                ),
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
                          ? const Color(0xFFE47000).withOpacity(0.6) // seçilen butonun rengi
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

class ProgressandStatus extends StatefulWidget {
  const ProgressandStatus({super.key});

  @override
  _ProgressandStatusState createState() => _ProgressandStatusState();
}

class _ProgressandStatusState extends State<ProgressandStatus> {
  bool isStatusSelected = false;
  final TextEditingController _progressController = TextEditingController();

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 6.0),
                child: Text(
                  'İlerleme',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 22.0),
                child: Text(
                  'Durum',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 4),

        Row(
          children: <Widget>[
            // İlerleme
            Expanded(
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 8),
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
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.center, 
                  children: <Widget>[
                    const Text(
                      '%',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _progressController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center, 
                        maxLength: 3,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 12),
                          hintText: '0',
                          border: InputBorder.none,
                          counterText: '',
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),

              ),
            ),

            const SizedBox(width: 55),

            // Durum
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isStatusSelected = !isStatusSelected;
                  });
                },
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isStatusSelected 
                    ? const Color(0xFFE47000).withOpacity(0.6) 
                    : Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.5,
                        blurRadius: 4,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Text(
                      'Ertelendi',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
