import 'package:flutter/material.dart';
import '../models/category.dart';

class SelectableCategoryRow extends StatefulWidget {
  final List<Category> categories;
  final Function(Category) onCategorySelected;

  const SelectableCategoryRow({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  _SelectableCategoryRowState createState() => _SelectableCategoryRowState();
}

class _SelectableCategoryRowState extends State<SelectableCategoryRow> {
  List<Category> selectedCategories = [];
  List<Category> availableCategories = [];

  @override
  void initState() {
    super.initState();
    availableCategories = List.from(widget.categories);
  }

  void _addNewCategory() async {
    final TextEditingController controller = TextEditingController();
    final newCategory = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          "Yeni Kategori Ekle",
        ),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: "Kategori adı",
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 14
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orangeAccent
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.orangeAccent
              )
            ) 
          ),
          autofocus: true,
        ),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, controller.text);
            },
            child: Text(
              "Ekle",
              style: TextStyle(
                color: Colors.orange[700]
              )
            ),
          ),
        ],
      ),
    );
    if (newCategory != null && newCategory.isNotEmpty) {
      final Category newCategoryObj = Category(name: newCategory);
      setState(() {
        if (!availableCategories.contains(newCategoryObj)) {
          availableCategories.add(newCategoryObj);
        }
        if (!selectedCategories.contains(newCategoryObj)) {
          selectedCategories.add(newCategoryObj);
        }
        widget.onCategorySelected(newCategoryObj);
      });
    }
  }

  void _removeCategory(Category category) {
    setState(() {
      selectedCategories.remove(category);
      availableCategories.add(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 6.0),
        ),
        const SizedBox(height: 4),
        Container(
          height: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1.5,
                blurRadius: 4,
              ),
            ],
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                onTap: _addNewCategory,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: const Icon(Icons.add, size: 24),
                ),
              ),
              const SizedBox(width: 8),
              ...selectedCategories.map((category) => GestureDetector(
                onTap: () => _removeCategory(category),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Text(category.name),
                      const SizedBox(width: 8),
                      const Icon(Icons.cancel, size: 18, color: Colors.red),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
