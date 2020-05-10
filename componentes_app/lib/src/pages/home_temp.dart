import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

final lista = ['Uno','Dos','Tres','Cuatro','Cinco','Uno','Dos','Tres','Cuatro','Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _crearItemsCorta(),
      ),
      );
  }


  //Version larga
  List<Widget> _crearItems(){
    
    List<Widget> items = new List<Widget>();

    for (String opt in lista) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      items..add(tempWidget)
           ..add(Divider(color: Colors.black, height: 5.0, thickness: 0.5, indent: 5.0, endIndent: 5.0,));
    }


    return items;
  }

  //Version corta
  List<Widget> _crearItemsCorta(){
    return lista.map((f) {
      return Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
            title: Text(f),
            subtitle: Text('Descripcion del tile'),
          ),
          Divider(
            color: Colors.black, 
            height: 5.0, 
            thickness: 0.5, 
            indent: 5.0, 
            endIndent: 5.0,
            ),
        ],
      );

    }).toList();
    
  }

}