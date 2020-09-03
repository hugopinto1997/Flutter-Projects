import 'package:flutter/material.dart';

class InternetProvider with ChangeNotifier {
    bool _internet;

    InternetProvider(){
      this._internet = true;
    }

    bool get internet => this._internet;

    setInternet(bool b){
      this._internet = b;
      Future.delayed(Duration.zero, (){
        notifyListeners();
      });
    }
}