import 'package:flutter/material.dart';
import 'package:form_validation/bloc/provider.dart';
import 'package:form_validation/pages/home_page.dart';
import 'package:form_validation/pages/login_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Provider(
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Formulario Bloc App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
        
      },
      theme: ThemeData(primaryColor: Colors.deepPurple),
    ),
    );
  }
}