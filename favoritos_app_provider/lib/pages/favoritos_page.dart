import 'package:favoritos_app_provider/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritosPage extends StatelessWidget {
  const FavoritosPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('FAV RECONSTRUIDA');
    final peliculasProvider = Provider.of<MoviesProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos Page'),
      ),
      body: ListView.builder(
        itemCount: peliculasProvider.favoritos.length,
        itemBuilder: (BuildContext context, int index) {
        final favs = peliculasProvider.favoritos;
        return CheckboxListTile(
          title: Text('${favs[index]['name']}'),
          value: favs[index]['checked'],
          onChanged: (val){
            peliculasProvider.setFav(favs[index]['id'], val);
          },
        );
       },
      ),
    );
  }
}