import 'package:flutter/material.dart';
import 'package:moor2_example/data/database.dart';
import 'package:moor2_example/pages/home_page.dart';
import 'package:provider/provider.dart';
 
 bool f = false;
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<AppDatabase>(
      create: (_) => AppDatabase(),
      dispose: (context, db) => db.close(),
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moor Tasks',
        home: HomePage(estado: false,),
      ),
    );
  }
}