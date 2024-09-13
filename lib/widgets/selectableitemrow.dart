import 'package:flutter/material.dart';

class SelectableItemRow<T> extends StatelessWidget {
  final String title;
  final List<T> items;
  final List<T> selectedItems;
  final void Function(T) onItemSelected;
  final void Function(T) onItemRemoved;
  final bool allowAddingNew;

  const SelectableItemRow({
    super.key,
    required this.title,
    required this.items,
    required this.selectedItems,
    required this.onItemSelected,
    required this.onItemRemoved,
    this.allowAddingNew = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: items.map((item) {
            final isSelected = selectedItems.contains(item);
            return ChoiceChip(
              label: Text(item.toString()), // item.toString() ile item'ı stringe dönüştürüyoruz
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  onItemSelected(item);
                } else {
                  onItemRemoved(item);
                }
              },
            );
          }).toList(),
        ),
        if (allowAddingNew)
          TextButton(
            onPressed: () {
              // Yeni kategori ekleme işlevini burada gerçekleştirin
            },
            child: const Text('Yeni Kategori Ekle'),
          ),
      ],
    );
  }
}
