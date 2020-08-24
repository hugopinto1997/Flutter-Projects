import 'package:favoritos_app_provider/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final peliculasProvider = Provider.of<MoviesProvider>(context);
    print('HOME RECONSTRUIDA');
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: ListView.builder(
        itemCount: peliculasProvider.peliculas.length,
        itemBuilder: (BuildContext context, int index) {
        final pelis = peliculasProvider.peliculas;
        return CheckboxListTile(
          title: Text('${pelis[index]['name']}'),
          value: pelis[index]['checked'],
          onChanged: (val){           
              peliculasProvider.setFav(pelis[index]['id'],val);
          }
        );
       },
      ),
    );
  }
}