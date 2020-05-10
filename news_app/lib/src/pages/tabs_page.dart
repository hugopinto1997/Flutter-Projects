import 'package:flutter/material.dart';
import 'package:news_app/src/pages/tab1_page.dart';
import 'package:news_app/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';


class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
          child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), title: Text('Inicio')),
        BottomNavigationBarItem(icon: Icon(Icons.public), title: Text('Encabezados')),
      ]
      );
  }
}

class _Paginas extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final _navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      controller: _navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
         
         Tab1Page(),
         
        Tab2Page(),
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int p){
    this._paginaActual = p;
    _pageController.animateToPage(p, duration: Duration(milliseconds: 250), curve: Curves.decelerate);
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}