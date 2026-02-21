import 'package:flutter/material.dart';
import 'package:mo3adel_university/calculating.dart';
import '../../constants.dart';
import '../../majors.dart';
import '../../modules.dart';

class Theappbody extends StatefulWidget {
  const Theappbody({super.key});
  @override
  State<Theappbody> createState() => _TheappbodyState();
}

class _TheappbodyState extends State<Theappbody> {
  // القائمة المتغيرة
  List<Modules> curruntModules = ENSPHY2;
  String selectedmajor = "1";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: kDefaultPadding,
            ),
            child: Container(
              margin: EdgeInsets.only(bottom: 19),
              constraints: BoxConstraints(minHeight: 50),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Expanded(
                      flex: 1,
                      child: MajorSelector(
                        selectedMajorId: selectedmajor,
                        onMajorChanged: (newId) {
                          setState(() {
                            selectedmajor = newId;
                            if (newId == "1") {
                              curruntModules = ENSPHY2;
                            } else if (newId == "2") {
                              curruntModules = ENSMATH2;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: ListView.builder(
                key: ValueKey<String>(selectedmajor),
                itemCount: curruntModules.length,
                itemBuilder: (context, index) {
                  return one_module_container(size, curruntModules[index]);
                },
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              calculating(context, curruntModules);
            },
            child: Text('أحسب المعدل', style: kTextStyleArabic),
          ),
        ],
      ),
    );
  }

  Container one_module_container(Size size, Modules module) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      width: size.width * 0.9,

      decoration: BoxDecoration(
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "المعامل: ${module.mo3amel}",
                  style: kTextStyleArabic.copyWith(fontSize: 16),
                ),
                Text(
                  module.name,
                  style: kTextStyleArabic.copyWith(fontSize: 18),
                ),
              ],
            ),

            Divider(thickness: 1),
            Row(
              children: [
                // خانة الامتحان 1
                Expanded(child: buildGradeInput(module.exam1cntrl, "E 1")),
                SizedBox(width: 5), // مسافة صغيرة
                // خانة الامتحان 2
                Expanded(child: buildGradeInput(module.exam2cntrl, "E 2")),
                SizedBox(width: 5),

                // خانة الـ TD
                Expanded(child: buildGradeInput(module.tdcntrl, "TD")),

                if (module.hastp) ...[
                  SizedBox(width: 5),
                  Expanded(child: buildGradeInput(module.tpcntrl, "TP")),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGradeInput(TextEditingController controller, String hintTitle) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: kTextStyleEnglish.copyWith(fontSize: 16),
      onChanged: (value) {
        // نفس منطق الفاصلة والرقم 20
        if (value.contains(',')) {
          value = value.replaceAll(',', '.');
          controller.text = value;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: value.length),
          );
        }
        double number = double.tryParse(value) ?? 0;
        if (number > 20) {
          controller.text = '20';
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
      },
      decoration: InputDecoration(
        labelText: hintTitle,
        labelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
