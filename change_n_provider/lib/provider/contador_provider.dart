import 'package:flutter/material.dart';

class ContadorProvider with ChangeNotifier {
  int _cont = 0;

  get conta => this._cont;

  set setConta(int c){
    this._cont = c;
    notifyListeners();
  }

  reset(){
    this._cont = 0;
    notifyListeners();
  }

}