import 'package:flutter/material.dart';
import 'package:preferencias/src/shared_prefs/preferencias_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';
@override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero;
  String _nombre;

  TextEditingController _textController;

    SharedPreferences _prefsU;


  @override
  void initState() {
    super.initState();
    _cargarPreferencias();
  }

  _cargarPreferencias() async {
    //_prefsU = await SharedPreferences.getInstance();
    final _p = await SharedPreferences.getInstance();
    _genero = _p.getInt('genero') ?? 1;
    _nombre = _p.getString('nombre') ?? 'no hay';
    _colorSecundario = _p.getBool('appbarColor');
    _textController = new TextEditingController(text: _nombre);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings de Usuario'),
        backgroundColor: _appBarColor(),
      ),
      drawer: DrawerMenu(pagina: SettingsPage.routeName,),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),),
          ),
          Divider(thickness: 0.5, color: Colors.black),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'),
            onChanged: (valor) {
              _colorSecundario = valor;
              _setBarColor(valor);
              
             }
          ),

          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio,
            
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona',
              ),
              onChanged: (texto){
                _setTexto(texto);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    
    prefs.setInt('genero', value);
    //_prefsU.setInt('genero', value);
      _genero = value;
      setState(() {
        
      });
  }
  _setTexto(String texto) async{
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('nombre', texto);
  }

  Color _appBarColor(){
    if(_colorSecundario){
      return Colors.red;
    }else{
      return Colors.blueGrey;
    }
  }
  _setBarColor(bool valor) async{
    SharedPreferences _fprefs = await SharedPreferences.getInstance();
    _fprefs.setBool('appbarColor', valor);
    setState(() {
      
    });
  }
}