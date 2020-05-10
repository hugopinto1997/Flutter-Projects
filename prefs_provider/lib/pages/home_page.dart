import 'package:flutter/material.dart';
import 'package:prefs_provider/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _valor = false;

  Future<Null> preferencias() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    _valor = _prefs.getBool('dark') ?? false;
    setState(() {
      
    });
  }

  @override
  void initState() {
    super.initState();
    preferencias();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: <Widget>[
          Switch(value: _valor, onChanged: (valor) {
            setState(() {
             _valor = valor;
             _changeTheme(context,_valor);
            });
          }),
        ],
      ),
      body: Center(child: Text('Dark Mode: $_valor'),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: (){}),
    );
  }

  _changeTheme(BuildContext context, bool value) async {

    final _tema = Provider.of<ThemeProvider>(context, listen: false);
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    
    _tema.setTheme(value);
    _prefs.setBool('dark', value);  
    
  }



}