import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:protoripo_super/pages/contactos_page.dart';
import 'package:protoripo_super/pages/detail_page.dart';
import 'package:protoripo_super/pages/home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

   // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Super App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'detail': (BuildContext context) => DetailPage(),
        'contactos': (BuildContext context) => ContactosPage(),
      },
    );
  }
}