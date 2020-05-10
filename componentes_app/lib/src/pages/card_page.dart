import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      body: ListView(
        //padding: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),

        ],
      ),
      
      );

  
  
  }

  Widget _cardTipo1() {

    return Card(
       child: Column(
         children: <Widget>[
            ListTile(
              leading: Icon(Icons.photo_album, color: Colors.blueGrey,),
              title: Text('Este es el titulo de esta tarjeta'),
              subtitle: Text('Este es el subtitulo de la tarjeta que vamos a utilizar como prototipo del primer estilo'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text('Cancelar'),
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {},
                ),
              ],
            ),
         ],
         ),
         color: Colors.white,
         elevation: 5.0,
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0) ,),
    );

  }

  Widget _cardTipo2() {
     final card =  Container(
       child: Column(
         children: <Widget>[
           FadeInImage(
             fadeInDuration: Duration(milliseconds: 500),
             height: 300.0,
             fit: BoxFit.cover,
             image: NetworkImage('https://i.pinimg.com/originals/2b/5f/85/2b5f850f1b2ffb9bd2444c3c58b517fe.jpg'),
             placeholder: AssetImage('data/assets/jar-loading.gif'),
           ),
           /*Image(image: NetworkImage('https://i.pinimg.com/originals/2b/5f/85/2b5f850f1b2ffb9bd2444c3c58b517fe.jpg')),*/
           Container(
             padding: EdgeInsets.all(10.0),
             child: Text('Descripcion del paisaje')
             ),
         ],
       ),
     );
     return Container(
       child: ClipRRect(child: card, borderRadius: BorderRadius.circular(30),),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30.0),
         color: Colors.white,
         boxShadow: <BoxShadow>[
           BoxShadow(
             color: Colors.black26,
             blurRadius: 10.0,
             spreadRadius: 1.0,
             offset: Offset(5,5),

           ),
         ]
         ),
     );
  }
}