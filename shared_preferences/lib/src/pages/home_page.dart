import 'package:flutter/material.dart';
import 'package:shared_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: DrawerMenu(pagina: routeName,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario: '),
          Divider(),
           Text('Genero: '),
          Divider(),
           Text('Nombre de Usuario: '),
          Divider(),

        ],
      ),
    );
  }

  

}