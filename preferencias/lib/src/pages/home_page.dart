import 'package:flutter/material.dart';
import 'package:preferencias/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  static final String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _genero;
  String _nombre;
  Color _color;
  bool _activado;


  @override
  void initState() {
    super.initState();
    _cargarPreferencias();
  }

  _cargarPreferencias() async {
    final _pr = await SharedPreferences.getInstance();
    _genero = _pr.getInt('genero') ?? 1;
    if(_pr.getBool('appbarColor')){
      _color = Colors.red;
    }else{
      _color = Colors.blueGrey;
    }
    _activado = _pr.getBool('appbarColor');
    _nombre = _pr.getString('nombre') ?? 'no hay';
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
        backgroundColor: _color,
      ),
      drawer: DrawerMenu(pagina: HomePage.routeName,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: $_activado'),
          Divider(),
           Text('Genero: $_genero'),
          Divider(),
           Text('Nombre de Usuario: $_nombre'),
          Divider(),

        ],
      ),
    );
  }
}