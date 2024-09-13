import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taskmanagerapp/models/userinfos.dart';
import 'package:taskmanagerapp/models/category.dart';
//import 'package:taskmanagerapp/widgets/selectableitemrow.dart';
import 'package:taskmanagerapp/widgets/selectablecategoryrow.dart';

// düzenleme sayfasının boş hali olacak

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  List<Category> selectedCategories = [];
  List<User> selectedUsers = [];
  List<Category> _categories = [];

  void _handleCategorySelected(Category category) {
    setState(() {
      if (!_selectedCategories.contains(category)) {
        _selectedCategories.add(category);
      }
    });
  }

  void _handleCategoryRemoved(Category category) {
    setState(() {
      _selectedCategories.remove(category);
    });
  }

  List<Category> _selectedCategories = [];
  void _onCategorySelected(Category category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        title: const Text('Görev Ekle'),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F7),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/gobackarrow.svg', height: 24.0, width: 24.0),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/tasks');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TaskName(),
              const SizedBox(height: 20),
              const TaskDescription(),
              const SizedBox(height: 32),
              dates(context),
              const SizedBox(height: 20),
              const TaskPriority(),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Kategoriler',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SelectableCategoryRow(
                categories: _categories,
                onCategorySelected: _handleCategorySelected,
              ),
              const SizedBox(height: 20),
              const ProgressandStatus(),
              const SizedBox(height: 40), 
              addButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Row dates(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(context, _startDateController),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _startDateController,
                      decoration: const InputDecoration(
                        hintText: 'Başlangıç Tarihi',
                        border: InputBorder.none,
                      ),
                      enabled: false,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () => _selectDate(context, _endDateController),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
                children: [
                  const Icon(Icons.calendar_today, color: Colors.grey),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _endDateController,
                      decoration: const InputDecoration(
                        hintText: 'Bitiş Tarihi',
                        border: InputBorder.none,
                      ),
                      enabled: false,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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
              Navigator.pushReplacementNamed(context, '/tasks');
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

  // Öncelik seviyesine göre renkleri tanımlıyoruz
  Color getButtonColor(int index) {
    if (selectedIndex == index) {
      switch (index) {
        case 0:
          return Colors.lightGreen.withOpacity(0.6); // Düşük: Açık yeşil
        case 1:
          return Colors.orange.withOpacity(0.6); // Orta: Açık turuncu
        case 2:
          return Colors.redAccent.withOpacity(0.6); // Yüksek: Açık kırmızı
        default:
          return Colors.white;
      }
    }
    return Colors.white; // Seçilmeyen butonun rengi
  }

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
                      color: getButtonColor(index), // Seçilen butona göre renk değişiyor
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
                    ? Colors.blue[200]
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
