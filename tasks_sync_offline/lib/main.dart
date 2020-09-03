import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:provider/provider.dart';
import 'package:tasks_sync_offline/database/database.dart';
import 'package:tasks_sync_offline/internet_provider.dart';
import 'package:tasks_sync_offline/internet_widget.dart';

import 'home_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
         Provider<TaskDao>(create: (context) => AppDatabase().taskDao,),
         ChangeNotifierProvider(create: (context) => InternetProvider()),
       ],
       child: _MateChild(),
    );
  }
}

class _MateChild extends StatelessWidget {
  const _MateChild({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final internetProvider = Provider.of<InternetProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OfflineBuilder(
          connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child){
            final bool connected = connectivity != ConnectivityResult.none;
            internetProvider.setInternet(connected);
            return HomePage();
          },
          child: Container(),
        ),
      theme: ThemeData.dark(),
    );
  }
}