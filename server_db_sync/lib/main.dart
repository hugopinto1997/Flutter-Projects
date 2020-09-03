import 'package:flutter/material.dart';
import 'package:server_db_sync/GridViewDemo.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Database sync App',
      home: GridViewDemo(),
      theme: ThemeData.dark(),
    );
  }
}