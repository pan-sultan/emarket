import 'package:flutter/material.dart';
import 'package:fe/drawer.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = '/contacts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Свяжитесь с нами"),
      ),
      body: Center(
        child: Text('Страница свяжитесь с нами'),
      ),
    );
  }
}
