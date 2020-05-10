import 'package:flutter/material.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/search/search_delegate.dart';
import 'package:peliculas/src/widgets/movie_horizontal.dart';

import '../src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        backgroundColor: Colors.indigoAccent,
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
           onPressed: () {
             showSearch(
               context: context,
               delegate: DataSearch(),
               //query: 'hola'
               );
           },)
        ],
      ),
      //Este widget sirve por lo del iphone del notch
      //body: SafeArea(child: ,),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTarjetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }

Widget _swiperTarjetas(){
  peliculasProvider.getEnCines();
  return FutureBuilder(
    future: peliculasProvider.getEnCines(),
    //initialData: ,
    builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
      if (snapshot.hasData){
        return CardSwiper(peliculas: snapshot.data,);
      }else{
        return Container(height:400.0,child: Center(child: CircularProgressIndicator(),));
      }
    },
  );
}

Widget _footer(BuildContext context){
  return Container(
    width: double.infinity,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(padding: EdgeInsets.only(left: 10.0),child: Text('Películas populares: ', style: Theme.of(context).textTheme.subhead,)),
        SizedBox(height: 5.0,),
        //Antes aqui iba un Future Builder, el future solo se puede ejecutar 1 vez mientras que el Stream se ejecuta cada vez que se le inserten cosas al Stream
        StreamBuilder(
          stream: peliculasProvider.popularesStream,
          //initialData: InitialData,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return MovieHorizontal(
                peliculas: snapshot.data,
                siguientePagina: peliculasProvider.getPopulares,
                );
            }else{
              return CircularProgressIndicator();
            }
          },
        ),

      ],
      ),
  );
}

}