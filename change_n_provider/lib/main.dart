import 'package:change_n_provider/widgets/contador.dart';
import 'package:change_n_provider/provider/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContadorProvider>(
      create: (BuildContext context) => ContadorProvider(),
      child: _MateApp()
    );
  }
}

class _MateApp extends StatelessWidget {
  const _MateApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //No queremos que se quede escuchando desde aqui, ya que seria innecesario redibujar la app desde tan alto nivel jerarquico por eso el listen: false
    final contador = Provider.of<ContadorProvider>(context, listen: false);
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ChangeNotifierProvider'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh), 
              onPressed: (){
                contador.reset();
              }
            )
          ],
        ),
        /*body: Center(
          child: Contador(),
        ),*/
        body: Consumer<ContadorProvider>(
          builder: (context, contador, _){
            return Center(child: Text('${contador.conta}', style: Theme.of(context).textTheme.headline1,));
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
              contador.setConta = contador.conta+1;
          },
          child: Icon(Icons.add),
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}