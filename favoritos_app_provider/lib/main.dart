import 'package:favoritos_app_provider/pages/favoritos_page.dart';
import 'package:favoritos_app_provider/pages/home_page.dart';
import 'package:favoritos_app_provider/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MoviesProvider(),
      child: _MateApp()
    );
  }
}

class _MateApp extends StatefulWidget {
  const _MateApp({
    Key key,
  }) : super(key: key);

  @override
  __MateAppState createState() => __MateAppState();
}

class __MateAppState extends State<_MateApp> {

  int _paginaSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: IndexedStack(
          children: <Widget>[
            HomePage(),
            FavoritosPage()
          ],
          index: _paginaSeleccionada,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _paginaSeleccionada,
          onTap: (value) {
            setState(() {
              _paginaSeleccionada = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
             BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favoritos')
            ),
          ],
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}