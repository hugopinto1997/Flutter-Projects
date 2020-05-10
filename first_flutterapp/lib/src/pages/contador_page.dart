import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ContadorPageState();
  }

}

class _ContadorPageState extends State<ContadorPage> {

final _estilo = new TextStyle(
    fontSize: 30, 
    fontWeight: FontWeight.bold
  );

  int _contador = 0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador App Stateful'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Contador de clicks:', 
            style: _estilo,
            ),
            Text('$_contador', style: _estilo,
            ),
          ],
        )
        ),
        floatingActionButton: _createButtons(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
    );
  }

    Widget _createButtons(){

      void _agregar(){
      
            setState(() {
              _contador++;
            });         
      }

      void _sustraer(){
            setState(() {
              if(_contador>0){
                _contador--;
              }
            });
      }

      void _reset(){
            setState(() {
              _contador = 0;              
            });
      }

      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SizedBox(width: 15.0,),
          FloatingActionButton(onPressed: _reset, child: Icon(Icons.exposure_zero), backgroundColor: Colors.black,),
          Expanded(child: SizedBox(width: 5,)),
          FloatingActionButton(onPressed: _sustraer, child: Icon(Icons.remove), backgroundColor: Colors.greenAccent,),
          SizedBox(width: 10.0,),
          FloatingActionButton(onPressed: _agregar, child: Icon(Icons.add),),
          SizedBox(width: 15.0,),
        ],
      );
  }


}