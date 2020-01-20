import 'package:flutter/material.dart';
import 'routes/routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createMagaziesItem(context),
          _createSearchItem(context),
          _createContactsItem(context),
        ],
      ),
    );
  }

  Widget _createMagaziesItem(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(Icons.library_books),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Журналы'),
          )
        ],
      ),
      onTap: () => Navigator.pushReplacementNamed(context, Routes.magazines),
    );
  }

  Widget _createSearchItem(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Поиск'),
          )
        ],
      ),
      onTap: () => Navigator.pushReplacementNamed(context, Routes.search),
    );
  }

  Widget _createContactsItem(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(Icons.contacts),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Свяжитесь с нами'),
          )
        ],
      ),
      onTap: () => Navigator.pushReplacementNamed(context, Routes.contacts),
    );
  }
}
