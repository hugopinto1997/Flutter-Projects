import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    
    return Container(
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black26,
          blurRadius: 50,
          spreadRadius: 10,
          offset: Offset(-50,10),
        ),
      ],
    ),
    padding: EdgeInsets.only(top: 10.0),
    child: Swiper(
    itemBuilder: (BuildContext context, int index) {
      peliculas[index].uniqueid = '${peliculas[index].id}-cosa';
      return Hero(
        tag: peliculas[index].uniqueid,
          child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: GestureDetector(
              onTap: (){
                  Navigator.pushNamed(context, 'detalle',arguments: peliculas[index]);
              },
              child: FadeInImage(
              image: NetworkImage(peliculas[index].getPosterImg()),
              placeholder: AssetImage('data/assets/no-image.jpg'),
              fit: BoxFit.cover,
              
              ),
          ),
        ),
      );
    },
    itemCount: peliculas.length,
    itemWidth: _screenSize.width*0.7,
    itemHeight: _screenSize.height*0.5,
    layout: SwiperLayout.STACK,
    //autoplay: true,
    duration: 500,
    curve: Curves.fastOutSlowIn,
 ),
  );
  }
}