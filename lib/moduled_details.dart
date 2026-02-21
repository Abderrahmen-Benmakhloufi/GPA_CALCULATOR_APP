import 'package:flutter/material.dart';
import 'constants.dart';
import 'modules.dart';

class ModuledDetails extends StatefulWidget {
  final Modules modules;
  const ModuledDetails({super.key, required this.modules});

  @override
  State<ModuledDetails> createState() => _ModuledDetailsState();
}

class _ModuledDetailsState extends State<ModuledDetails> {
  List<Modules> curruntModules = ENSPHY2;
  String selectedmajor = "1";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Hero(
          tag: 'details',
          child: Text(
            widget.modules.name,
            style: kTextStyleArabic,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
