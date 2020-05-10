import 'package:flutter/material.dart';
import 'package:shared_preferences/src/pages/home_page.dart';
import 'package:shared_preferences/src/pages/settings_page.dart';

class DrawerMenu extends StatelessWidget {
  
  final String pagina;
  final _arreglo = [false,false,false];
  DrawerMenu({this.pagina});

  final Map<String,int> _rutas = {
    HomePage.routeName: 0,
    'people': 1,
    SettingsPage.routeName: 2
  };

  void _setSelected(){
    _arreglo[_rutas[pagina]] = true;
  }

  @override
  Widget build(BuildContext context) {
    _setSelected();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/menu.jpg'),fit: BoxFit.cover),
            ),
            ),
            ListTile(
              leading: Icon(Icons.pages),
              title: Text('Pages'),
              selected: _arreglo[0],
              onTap: () {
                Navigator.pushReplacementNamed(context, HomePage.routeName, arguments: HomePage.routeName);
              },
            ),
             ListTile(
              leading: Icon(Icons.party_mode),
             selected: _arreglo[1],
              title: Text('People'),
              onTap: () { },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              selected: _arreglo[2],
              onTap: () {
                // Equivale a levantar una Activity
                //Navigator.pushNamed(context, 'settings');
                Navigator.pushReplacementNamed(context, 'settings', arguments: SettingsPage.routeName );
              },
            ),
        ],
      ),
    );
  }
}