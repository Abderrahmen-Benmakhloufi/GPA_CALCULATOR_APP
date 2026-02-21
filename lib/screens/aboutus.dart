import 'package:flutter/material.dart';
import 'package:mo3adel_university/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lighmode,
      darkTheme: darkmode,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: const EdgeInsets.all(20.0)),
              Text(
                'Abderrahmen Benmakhloufi',
                style: kTextStyleEnglish.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'App developer',
                style: kTextStyleEnglish.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(width: 200, height: 20, child: Divider()),
              Text(
                'for Contact',
                style: kTextStyleEnglish.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.instagram, size: 20),
                    title: SelectableText(
                      'abdo_amf_10',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: Icon(Icons.mail, size: 20),
                    title: SelectableText(
                      'abdobenmakhloufi@gmail.com',
                      style: TextStyle(
                        fontFamily: 'cairo',
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
