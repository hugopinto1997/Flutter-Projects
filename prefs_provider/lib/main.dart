import 'package:flutter/material.dart';
import 'package:prefs_provider/pages/home_page.dart';
import 'package:prefs_provider/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
 SharedPreferences prefs;
bool tema;
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  tema = prefs.getBool('dark') ?? false;
  print('el bool: $tema');
  
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider(tema)),
        ],
        child: _MaterialAppChild(),
    );
  }
}


class _MaterialAppChild extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final _tema = Provider.of<ThemeProvider>(context);

    return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Material App',
    initialRoute: 'home',
    routes: {
      'home': (BuildContext context) => HomePage(),
    },
    theme: _tema.getTema(),
      );
  }
}