import 'package:flutter/material.dart';
import 'package:form_validation/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage
({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          Text(bloc.email),
          Text(bloc.password),
          
        ],
      ),
    );
  }
}