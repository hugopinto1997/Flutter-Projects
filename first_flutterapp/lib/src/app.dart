import 'package:first_flutterapp/src/pages/contador_page.dart';
import 'package:flutter/material.dart';
import './pages/home_page.dart';

class MyApp extends StatelessWidget {
  
  @override
  Widget build( BuildContext context ){

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        //Asi era cuando era StatelessWidget
        //child: HomePage(),
        //Asi es StatefulWidget
        child: ContadorPage(),
      ),
    );
  }
}