import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/theappbody.dart';
import 'screens/aboutus.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 2.0;
  runApp(const Calc());
}

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'حساب المعدل',
      home: calce(),
      debugShowCheckedModeBanner: false,
      theme: lighmode,
      darkTheme: darkmode,
    );
  }
}

class calce extends StatefulWidget {
  const calce({super.key});

  @override
  State<calce> createState() => _calceState();
}

class _calceState extends State<calce> {
  int _selectedindex = 0;

  final List<Widget> Pages = [const Theappbody(), const Aboutus()];
  void _tappeditem(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _selectedindex == 0 ? 'حساب المعدل' : ' حول التطبيق',
          style: kTextStyleArabic,
        ),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.menu))],
      ),
      body: IndexedStack(index: _selectedindex, children: Pages),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedindex,
        onTap: _tappeditem,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "حول التطبيق"),
        ],
      ),
    );
  }
}
