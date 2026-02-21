import 'package:flutter/material.dart';
import 'package:mo3adel_university/constants.dart';
import 'package:mo3adel_university/modules.dart';

void calculating(BuildContext context, List<Modules> curruntModules) {
  double totalScore = 0;
  int totalCoeff = 0;
  for (var module in curruntModules) {
    double td = double.tryParse(module.tdcntrl.text) ?? 0;
    double tp = double.tryParse(module.tpcntrl.text) ?? 0;
    double exam1 = double.tryParse(module.exam1cntrl.text) ?? 0;
    double exam2 = double.tryParse(module.exam2cntrl.text) ?? 0;
    if (module.hastp) {
      double grade = (td + exam2 + exam1 + tp) / 4;
      totalScore += grade * module.mo3amel;
      totalCoeff += module.mo3amel;
    } else {
      double grade = (td + exam2 + exam1) / 3;
      totalScore += grade * module.mo3amel;
      totalCoeff += module.mo3amel;
    }
  }
  double mo3adel = totalCoeff == 0 ? 0 : totalScore / totalCoeff;

  // إظهار النتيجة
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          'النتيجة',
          style: kTextStyleArabic,
          textAlign: TextAlign.right,
        ),
        content: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: mo3adel),
          duration: Duration(seconds: 1),
          builder: (context, value, child) {
            return Text(
              'معدلك هو: ${value.toStringAsFixed(2)}',

              style: kTextStyleArabic.copyWith(
                color: mo3adel >= 10 ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("تم"),
          ),
        ],
      );
    },
  );
}
