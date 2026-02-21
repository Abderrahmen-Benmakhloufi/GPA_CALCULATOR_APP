import 'package:flutter/material.dart';
import 'constants.dart';

class MajorOptions {
  final String id;
  final String title;
  MajorOptions({required this.id, required this.title});
}

class MajorSelector extends StatelessWidget {
  // 1. نستقبل القيمة والدالة من الأب (Theappbody)
  final String selectedMajorId;
  final Function(String) onMajorChanged;

  MajorSelector({
    required this.selectedMajorId,
    required this.onMajorChanged,
    super.key,
  });

  final List<MajorOptions> majorsList = [
    MajorOptions(id: "1", title: "فيزياء سنة 2 ENS"),
    MajorOptions(id: "2", title: "رياضيات سنة 2 ENS"),
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        alignment: Alignment.centerRight,
        hint: Text("اختر التخصص", style: kTextStyleArabic),
        icon: Icon(Icons.keyboard_arrow_down),
        style: kTextStyleArabic,

        value: selectedMajorId,

        items: majorsList.map((MajorOptions item) {
          return DropdownMenuItem<String>(
            value: item.id,
            child: Text(
              item.title,
              style: kTextStyleArabic.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          );
        }).toList(),

        onChanged: (newValue) {
          if (newValue != null) {
            onMajorChanged(newValue);
          }
        },
      ),
    );
  }
}
