import 'package:flutter/widgets.dart';

class Modules {
  final String name;
  final int mo3amel;
  final bool hastp;
  late TextEditingController tdcntrl;
  late TextEditingController tpcntrl;
  late TextEditingController exam1cntrl;
  late TextEditingController exam2cntrl;

  Modules({required this.name, required this.mo3amel, this.hastp = false}) {
    tdcntrl = TextEditingController();
    tpcntrl = TextEditingController();
    exam1cntrl = TextEditingController();
    exam2cntrl = TextEditingController();
  }
}

List<Modules> ENSPHY2 = [
  Modules(name: "إهتزازات", mo3amel: 3, hastp: true),
  Modules(name: "طرائق رياضية", mo3amel: 4),
  Modules(name: "إالكترونيك", mo3amel: 4, hastp: true),
  Modules(name: "كيمياء معدنية", mo3amel: 4, hastp: true),
  Modules(name: "كيمياء حركية", mo3amel: 3, hastp: true),
  Modules(name: "ضوء", mo3amel: 3, hastp: true),
  Modules(name: "علم النفس", mo3amel: 2),
  Modules(name: "إعلام آلي", mo3amel: 2, hastp: true),
];

List<Modules> ENSMATH2 = [
  Modules(name: "طوبولوجيا", mo3amel: 4),
  Modules(name: "الجبر العام ", mo3amel: 2),
  Modules(name: "الجبر الخطي", mo3amel: 2),
  Modules(name: "التحليل 2", mo3amel: 2),
  Modules(name: " الحساب التفاضلي ", mo3amel: 2),
  Modules(name: "الهندسة الفضائية", mo3amel: 2),
  Modules(name: "علم النفس", mo3amel: 2),
  Modules(name: " الهندسة 1", mo3amel: 2),
];
