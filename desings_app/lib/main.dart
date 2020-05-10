import 'package:desings_app/src/pages/basico.dart';
import 'package:desings_app/src/pages/grid_page.dart';
import 'package:desings_app/src/pages/scroll_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Cambiar a blanco la status bar
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.white));*/

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design app',
      initialRoute: 'grid',
      routes: {
        'basico': (BuildContext context) => BasicoPage(),
        'scroll': (BuildContext context) => ScrollPage(),
        'grid': (BuildContext context) => GridPage(),
      },
    );
  }
}