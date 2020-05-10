import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;

  final Function siguientePagina;

  MovieHorizontal({ @required this.peliculas, @required this.siguientePagina});

  final _pageController = new PageController(
          initialPage: 2,
          viewportFraction: 0.3,
        );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener((){
        if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
            siguientePagina();
        }
    });

    return Container(
      height: _screenSize.height*0.2,
      child: PageView.builder(
        pageSnapping: true,
        controller: _pageController,
        //asi era cuando era PageView
        //children: _tarjetas(),
        itemBuilder: (BuildContext context, int index){
            return _crearTarjeta(context, peliculas[index]);
        },
        itemCount: peliculas.length,
      ),
    );
  }

Widget _crearTarjeta(BuildContext context, Pelicula pelicula){

  pelicula.uniqueid = '${pelicula.id}-poster';

  final tarjeta = Container(
        decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
          color: Colors.black,
          blurRadius: 10,
          spreadRadius: 0.1,
          offset: Offset(-5,-25),
        ),
      ],
    ),
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqueid,
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('data/assets/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 120,
                  ),
              ),
            ),
            SizedBox(height: 2.0,),
            Text(pelicula.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),), 
          ],
        ),
      );
  return GestureDetector(
    child: tarjeta,
    onTap: (){
      Navigator.pushNamed(context, 'detalle', arguments: pelicula);
    },
  );
}

//Esto se usaba cuando era PageView
/*
  List<Widget> _tarjetas(){
    return peliculas.map((pelicula){
      return Container(
        decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          spreadRadius: 0.1,
          offset: Offset(-5,-25),
        ),
      ],
    ),
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('data/assets/no-image.jpg'),
                fit: BoxFit.cover,
                height: 120,
                ),
            ),
            SizedBox(height: 2.0,),
            Text(pelicula.title, overflow: TextOverflow.ellipsis, style: TextStyle(fontWeight: FontWeight.bold),), 
          ],
        ),
      );
    }).toList();
  }*/

}