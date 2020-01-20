import 'package:flutter/material.dart';
import 'package:fe/drawer.dart';

class SearchPage extends StatelessWidget {
  static const String routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("Поиск"),
      ),
      body: Center(
        child: Text('Страница поиска'),
      ),
    );
  }
}
