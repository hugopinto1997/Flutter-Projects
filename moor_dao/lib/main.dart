import 'package:flutter/material.dart';
import 'package:moor_dao/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'database/database.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TaskDao>(
          create: (_) => AppDatabase().taskDao,
        ),
      ],
      //dispose: (context, db) => db.close(), 
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Moor Example',
        home: HomePage(estado: false,),
      ),
    );
  }
}