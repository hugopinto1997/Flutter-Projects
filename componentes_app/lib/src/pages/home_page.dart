import 'package:componentes_app/src/pages/alert_page.dart';
import 'package:componentes_app/src/utils/icono_string_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../providers/menu_provider.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes App'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.black,
      body: _lista(),
      );
  }

 Widget _lista() {
    
    //menuProvider.cargarData();

    return FutureBuilder(
      initialData: [],
      future: menuProvider.cargarData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(
           children: _crearListaItems(snapshot.data, context),
        );

      },
    );

    /*return ListView(
      children: _crearListaItems(),
    );*/
  }

List<Widget> _crearListaItems(List<dynamic> data, BuildContext context){
  final List<Widget> opc = [];

  data.forEach((datos){
    final widgetTemp = ListTile(
      title: Text(datos['texto'], style: TextStyle(color: Colors.white),),
      leading: getIcon(datos['icon']),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
      onTap: () {
        /*final route = MaterialPageRoute(
          builder: (context) => AlertPage(),
        );
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, datos['ruta']);
      },
    );
    opc..add(widgetTemp)
       ..add(Divider(color: Colors.white, thickness: 0.5, height: 1.0, indent: 10.0, endIndent: 10.0,));

  });
  return opc;

}

}