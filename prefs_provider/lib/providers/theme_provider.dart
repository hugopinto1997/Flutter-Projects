import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {

  ThemeData _tema;
  bool _activo;

  List<ThemeData> _temas = [
    ThemeData.dark(),
    ThemeData.light(),
  ];

  ThemeProvider(bool act){
    if(act){
      this._tema = _temas[0];
    }else{
      this._tema = _temas[1];      
    }
  }

  /*_getEstado() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _activo = _prefs.getBool('darkTheme') ?? false;
  }*/



  getTema() => this._tema;

  setTheme(bool t) {
    if(t){
      this._tema = _temas[0];
    }else{
      this._tema = _temas[1];      
    }
    notifyListeners();
  }


}