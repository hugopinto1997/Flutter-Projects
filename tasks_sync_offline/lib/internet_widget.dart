import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks_sync_offline/internet_provider.dart';

class InternetWidget extends StatelessWidget {
  const InternetWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ip = Provider.of<InternetProvider>(context);
    return 
            AnimatedContainer(
                    height: (ip.internet) ? 0 : 32,
                    duration: Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                       color: ip.internet ? Colors.green : Colors.red,
                    ),
                    child: Center(child: Text('${ip.internet ? 'Connected' : 'No internet connection'}'),),
                  );
  }
}