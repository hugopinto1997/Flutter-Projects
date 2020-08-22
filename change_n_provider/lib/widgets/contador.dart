import 'package:change_n_provider/provider/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contador extends StatelessWidget {
  const Contador({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Aqui es necesario redibujar, por ello por defecto es listen: true
    final contador = Provider.of<ContadorProvider>(context);
    return Container(
      child: Text('${contador.conta}', style: Theme.of(context).textTheme.headline1,),
    );
  }
}