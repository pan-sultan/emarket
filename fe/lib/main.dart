import 'package:flutter/material.dart';
import 'routes/routes.dart';
import 'pages/magazines.dart';
import 'pages/search.dart';
import 'pages/contacts.dart';

void main() => runApp(EMarketApp());

class EMarketApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: Colors.green),
      home: MagazinesPage(),
      routes: {
        Routes.magazines: (context) => MagazinesPage(),
        Routes.search: (context) => SearchPage(),
        Routes.contacts: (context) => ContactsPage(),
      },
    );
  }
}
