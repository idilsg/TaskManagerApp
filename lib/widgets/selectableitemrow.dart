
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/userinfos.dart';
import '../models/category.dart';

class SelectableItemRow extends StatefulWidget {
  final String title;
  final List<dynamic> items;
  final Function(dynamic) onItemSelected;
  final bool allowAddingNew;

  const SelectableItemRow({
    super.key,
    required this.title,
    required this.items,
    required this.onItemSelected,
    this.allowAddingNew = false,
  });

  @override
  _SelectableItemRowState createState() => _SelectableItemRowState();
}

class _SelectableItemRowState extends State<SelectableItemRow> {
  List<dynamic> selectedItems = [];

  void _addNewItem() async {
    if (widget.allowAddingNew) {
      final TextEditingController controller = TextEditingController();
      final newCategory = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Yeni Kategori Ekle"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Kategori adı"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, controller.text);
              },
              child: const Text("Ekle"),
            ),
          ],
        ),
      );
      if (newCategory != null && newCategory.isNotEmpty) {
        setState(() {
          widget.items.add(Category(name: newCategory));
        });
      }
    } else {
      final dynamic selectedItem = await showDialog<dynamic>(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Text("Kişi Seç"),
          children: widget.items
            .where((item) => !selectedItems.contains(item))
            .map((item) => SimpleDialogOption(
              onPressed: () => Navigator.pop(context, item),
              child: Row(
                children: [
                  if (item is User) ...[
                    CircleAvatar(backgroundImage: NetworkImage(item.profileUrl)),
                    const SizedBox(width: 8),
                    Text(item.name),
                  ] else if (item is Category) ...[
                    Text(item.name),
                  ]
                ],
              ),
            ))
          .toList(),
        ),
      );
      if (selectedItem != null) {
        setState(() {
          selectedItems.add(selectedItem);
          widget.onItemSelected(selectedItem);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                onTap: _addNewItem,
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
              ...selectedItems.map((item) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: Row(
                  children: [
                    if (item is User) ...[
                      CircleAvatar(backgroundImage: NetworkImage(item.profileUrl), radius: 15),
                      const SizedBox(width: 8),
                      Text(item.name),
                    ] else if (item is Category) ...[
                      Text(item.name),
                    ]
                  ],
                ),
              ))
            ],
          ),
        ),
      ],
    );
  }
}
