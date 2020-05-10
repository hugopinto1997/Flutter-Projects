import 'package:flutter/material.dart';
import 'package:shared_preferences/src/widgets/menu_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

@override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = new TextEditingController(text: _nombre);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings de Usuario'),
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
              setState(() {
                
              });
             }
          ),

          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: (valor) {
              _genero = valor;
              setState(() {
                
              });
            }
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: (valor) {
              _genero = valor;
              setState(() {
                
              });
            }
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
                
              },
            ),
          ),
        ],
      ),
    );
  }
}