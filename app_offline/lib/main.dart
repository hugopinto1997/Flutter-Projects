import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Offline'),
        ),
        body: OfflineBuilder(
          connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child){
            final bool connected = connectivity != ConnectivityResult.none;
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  height: 32.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    color: connected ? Colors.green : Colors.red,
                    child: Center(child: Text('${connected ? 'Connected' : 'Not Connected'}'),),
                  ),
                ),
                Center(
                child: new Text(
                  'Yay!',
                ),
                ),
              ],
            );
          },
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'There are no bottons to push :)',
            ),
            new Text(
              'Just turn off your internet.',
            ),
          ],
        ),
        ),
      ),
      theme: ThemeData.dark(),
    );
  }
}