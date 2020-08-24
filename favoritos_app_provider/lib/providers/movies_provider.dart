import 'package:flutter/material.dart';


class MoviesProvider with ChangeNotifier {

  List<Map> _movies = new List();
  List<Map> _favs = new List();


  MoviesProvider(){
    this._movies = [
    {'id': 0, 'name': '1917', 'checked': false},
    {'id': 1, 'name': 'Avengers: Endgame', 'checked': false},
    {'id': 2, 'name': 'Mi Villano favorito', 'checked': false},
    {'id': 3, 'name': 'Deadpool', 'checked': false},
    {'id': 4, 'name': '1917', 'checked': false},
    {'id': 5, 'name': 'Capitana Marvel', 'checked': false},
   ];
  }

  setFav(int id, bool val){
    _movies.forEach((element) {
      if(element['id'] == id){
        element['checked'] = val;
        if(element['checked']){
           _favs.add(element);
        }else{
           _favs.remove(element);
        }
        notifyListeners();
      }
    });
  }

  List<Map> get peliculas => this._movies;

 List<Map> get favoritos => this._favs;

}