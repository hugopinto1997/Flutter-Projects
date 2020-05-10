import 'dart:math';

import 'package:flutter/material.dart';

class GridPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _title(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blueAccent,
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Container()
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Container(),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Container()
            ),
        ]
        ),
    );
  }

  Widget _fondoApp(){

    final _gradiente = Container(width: double.infinity, height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromRGBO(52,54,101,1), Color.fromRGBO(35,37,57,1)],
        begin: FractionalOffset(0.0, 0.7),
        end: FractionalOffset(0.0, 1.0),
        ),
    ),
    );

    final _cajaRosada = Transform.rotate(
      angle: -pi/5,
      child: Container(
        height: 360,
        width: 360,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(236,98, 188, 1),
            Color.fromRGBO(241,142,172,1)
          ]),
          borderRadius: BorderRadius.circular(80),
        ),
    ),
      );

    return Stack(
      children: <Widget>[
        _gradiente,
        Positioned(
          top: -100,
          child: _cajaRosada
          )
      ],
    );
  }

  Widget _title(){
    return SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classified Transaction', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            Text('Classify transaction into this category', style: 
            TextStyle(color: Colors.white, fontSize: 16)),

          ],
        ),
      ),
    );
  }

  /*Widget _bottomNavigationBar(){
    return 
  }*/
}