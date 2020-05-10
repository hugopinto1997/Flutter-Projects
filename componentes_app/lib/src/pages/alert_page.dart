import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Mostrar alerta'),
          color: Colors.blue,
          shape: StadiumBorder(),
          textColor: Colors.white,
          onPressed: (){
            _mostrarAlert(context);
        }),
      ),
      );
  }

  void _mostrarAlert(BuildContext context){
     showDialog(
       context: context,
       barrierDismissible: true,
       builder: (context){
         return AlertDialog(
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
           title: Text('Titulo de la alerta'),
           actions: <Widget>[
             FlatButton(
               child: Text('CANCELAR'),
               onPressed: (){
                  Navigator.of(context).pop();
               },
               ),
                FlatButton(
               child: Text('OK'),
               onPressed: (){

               },
               ),
           ],
           content: Column(
             mainAxisSize: MainAxisSize.min,
             children: <Widget>[
               Text('Contenido de la alerta'),
               FlutterLogo(size: 100.0,),
             ],
             
           ),
           

         );
       }
       );
  }
}