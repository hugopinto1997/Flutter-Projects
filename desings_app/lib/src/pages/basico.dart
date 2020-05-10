import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final _estiloTitulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final _estiloSubTitulo = TextStyle(fontSize: 14,);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          _crearImagen(),
          _crearTexto(),
          _crearBotones(),
          _crearDescripcion()
        ]
        ),
      ),
    );
  }

  Widget _crearImagen(){
    return  Image(image: NetworkImage('https://image.shutterstock.com/image-photo/colorful-hot-air-balloons-flying-260nw-1033306540.jpg'),);
  }

  Widget _crearTexto(){
    return SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20.0,),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Lago con puente', style: _estiloTitulo,),
                        SizedBox(height: 7,),
                        Text('Lago de cualquier lado', style: _estiloSubTitulo,),
                      ],
                    ),
                  ),
                  Icon(Icons.star, size: 30.0,),
                  Text('41', style: TextStyle(fontSize: 20,)),
                ],
              ),
            ),
    );
  }

  Widget _crearAccion(IconData icono, String titulo){
    return Column(
            children: <Widget>[
              Icon(icono, color: Colors.blue, size: 30,),
              Text(titulo, style: TextStyle(fontSize: 15, color: Colors.blue),),
            ],
          );
  }

  Widget _crearBotones(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
         _crearAccion(Icons.call, 'CALL'),
         _crearAccion(Icons.near_me, 'ROUTE'),
         _crearAccion(Icons.share, 'SHARE')
           
        ],
      ),
    );
  }

  Widget _crearDescripcion(){
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text('asldfjaklsdjfkalsd jfldksajlksfdjl kasjdlk fjalksdj lfakdsjl fkasldfk ajlsdkfjalsdk jlfakdjsl kfajlskdfj laks jldfkajsdlk fjlaskdjflakdsjlfkasjdlfkajsldkfjalsd jlfkdjalksdjflkasjlfdkajsl dkfajsldfkjalsdkfjalskd fjodi jfiud fiuajodufao9sdifauhjdfuiajodsihfoa9 hdso9fahdsofhoaduhfurhgigurj ij  h i uh uh 9 ho9 iujh 9 uih iuhjfidajpjsdfjkasd;fjaidhf8rhei9fhhriegh9erhg9er8ijg9er8g9e8rjg98re')),
    );
  }

}