import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/bloc/login_bloc.dart';
export 'package:form_validation/bloc/login_bloc.dart';


class Provider extends InheritedWidget {

  static Provider _instancia;

  factory Provider({ Key key, Widget child }){
      if(_instancia==null){
        _instancia = new Provider._internal(key: key, child: child,);
      }

      return _instancia;
  }


  final loginBloc = LoginBloc();

  /*Provider({ Key key, Widget child })
  : super(key: key, child: child);*/

Provider._internal({ Key key, Widget child })
  : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

  static LoginBloc of( BuildContext context ){
    return (context.dependOnInheritedWidgetOfExactType<Provider>()).loginBloc;
  }
}