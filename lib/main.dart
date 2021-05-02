import 'package:flutter/material.dart';
import 'contacts.dart';
import 'newContact.dart';
import 'oboarding.dart';
import 'package:logger/logger.dart';
import 'package:contactlist/logger.util.dart';

void main() {
  Logger.level = Level.debug;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/main': (context) => ContactSite(),
        '/newContact': (context) => NewContact()
      },
      title: 'Kontaktliste',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Onboarding(),
    );
  }
}
