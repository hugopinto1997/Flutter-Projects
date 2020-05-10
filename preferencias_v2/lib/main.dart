import 'package:flutter/material.dart';
import 'package:preferencias_v2/src/pages/home_page.dart';
import 'package:preferencias_v2/src/pages/settings_page.dart';
import 'package:preferencias_v2/src/share_prefs/preferencias_usuario.dart';

 
void main(){
 
  runApp(MyApp());

}
 
class MyApp extends StatelessWidget {

  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preferencias',
      initialRoute: prefs.ultimaPagina,
      routes: {
        HomePage.routeName     : ( BuildContext context ) => HomePage(),
        SettingsPage.routeName : ( BuildContext context ) => SettingsPage(),
      },
    );
  }
}