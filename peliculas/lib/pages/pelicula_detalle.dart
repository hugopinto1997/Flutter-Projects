import 'package:flutter/material.dart';
import 'package:peliculas/models/actores_model.dart';
import 'package:peliculas/models/pelicula_model.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';

class PeliculaDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

      final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(pelicula),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  SizedBox(height: 5.0,),
                  _posterTitulo(context, pelicula),
                  _descripcion(pelicula),
                  _crearCasting(pelicula),
                ]
              ),
              )
          ],
          ),
    );
  }

  Widget _crearAppBar(Pelicula pelicula){
      return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.blueGrey,
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('data/assets/no-image.jpg'),
            image: NetworkImage(pelicula.getBackdropPath())),
          title: Text(
            pelicula.title,
            overflow: TextOverflow.ellipsis,maxLines: 1,
            style: TextStyle(fontSize: 16.0,
           ),
          ),
          titlePadding: EdgeInsets.only(right: 80, left:80, bottom:15),
        ),
      );
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueid,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: NetworkImage(pelicula.getPosterImg()),
                 height: 150.0,
                ),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(pelicula.title,
                style: Theme.of(context).textTheme.title,),
                 Text(pelicula.title,
                 overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.title,),

                Text(pelicula.originalTitle,
                 overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,),

                Row(
                  children: <Widget>[
                    Icon(Icons.star_border, size: 30,),
                    SizedBox(width: 10,height:40),
                    Text(
                      pelicula.voteAverage.toString(), 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )
                  ],
                  )
              ],),
          ),
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula){
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Text(pelicula.overview, textAlign: TextAlign.justify,),
    );
  }

  Widget _crearCasting(Pelicula pelicula){
    
    final _peliculasProvider = new PeliculasProvider();

    return FutureBuilder(
      future: _peliculasProvider.getCast(pelicula.id.toString()),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
       if(snapshot.hasData){
          return _crearActoresPageView(snapshot.data); 
       }else{
         return Center(child: CircularProgressIndicator(),);
       }
      },
    );
  }

  Widget _crearActoresPageView(List<Actor> actores){
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        itemBuilder: (context, int index){
          return _tarjetaActor(actores[index]);
        },
        itemCount: actores.length,
        controller: PageController(
          viewportFraction: 0.3,
          initialPage: 1,
        ),
        ),
    );
  }

  Widget _tarjetaActor(Actor actor){
      return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                image: NetworkImage(actor.getFoto()),
                fit: BoxFit.cover,
                height: 140,
                placeholder: AssetImage('data/assets/no-image.jpg'),
                ),
            ),
            SizedBox(height: 2),
            Text(actor.name, style: TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
          ],
        ),
      );
  }

}