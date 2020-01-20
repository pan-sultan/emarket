import 'package:flutter/material.dart';
import 'package:fe/drawer.dart';

class MagazinesPage extends StatelessWidget {
  static const String routeName = '/magazines';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Журналы"),
      ),
      body: Center(
        child: Text('Страница журналов'),
      ),
    );
  }
}
