import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final estilo = new TextStyle(
    fontSize: 40, 
    fontWeight: FontWeight.bold
  );

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador App'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Contador de clicks:', 
            style: estilo,
            ),
            Text('$contador', style: estilo,
            ),
          ],
        )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {contador++;},
          child: Icon(Icons.add),
          backgroundColor: Colors.blueGrey,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
    );
  }

}