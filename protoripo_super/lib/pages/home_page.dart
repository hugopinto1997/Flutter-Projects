import 'package:auro_shadow_text/auro_shadow_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<int> _lista = [1,2,3,4];
  List<String> _listaName = [
    'Lista de Super Selectos',
    'Lista de Walmart',
    'Lista de PriceSmart',
    'Lista de El Baratillo'
  ];

List<String> _listaCreador = [
    'Creada por: Ernesto H.',
    'Creada por: Sebastián L.',
    'Creada por: Max E.',
    'Creada por: Hugo P.',
  ];
  int _index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Color.fromRGBO(52,54,101,1),),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _fondo(),
            _pantalla(),
          ],
        ),
     ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: _index,
       elevation: 5,
       unselectedItemColor: Colors.grey,
        fixedColor: Colors.white,
        backgroundColor: Colors.white,
        iconSize: 36,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:  ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.blueAccent,
                child: Icon(Icons.home),
              ),
              ),
            title: Container(),
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt,),
            title: Container(),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt,),
            title: Container(),
            ),
        ],
        onTap: (ind) {
            setState(() {
              _index = ind;
            });
         },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
          ),

    );
  }


  Widget _crearAppBar(){
      return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        expandedHeight: 150.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('data/assets/no-image.jpg'),
            image: NetworkImage('https://www.foodtownmarket.com/images/shopping-list.jpg')),
          title: new ShadowText(
                  'Tus listas',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    //fontWeight: FontWeight.bold,
                  ),
                  shadowTop: 0.5,
                  shadowLeft: 0.5,
                  opacityStyle: Colors.grey.withOpacity(1.0),
                  softWrap: true,
                  textScaleFactor: 1,
                ),
          ),
        );
  }



  Widget _pantalla(){
    return Container(
          //padding: EdgeInsets.only(top: 10, left: 20),
         //width: double.infinity,
          //color: Colors.black,
          child: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  SizedBox(height: 5,),
                  _listaMap(context, 0),
                  _listaMap(context, 1),
                  _listaMap(context, 2),
                   _listaMap(context, 3),
                  _listaMap(context, 1),
                  _listaMap(context, 2),
 _listaMap(context, 0),
                  _listaMap(context, 0),
                  _listaMap(context, 0), _listaMap(context, 0),
                  _listaMap(context, 0),
                  _listaMap(context, 0),

                           
                ]
              ),
              )
          ],
          ),
    );
  }

  Widget _fondo(){
    return Container(width: double.infinity, height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromRGBO(248,248,248,1), Color.fromRGBO(255,255,255,1)],
        begin: FractionalOffset(0.0, 0.1),
        end: FractionalOffset(0.0, 1.0),
        ),
    ),
    );
  }

  Widget _crearLista(BuildContext context){
    return ListView.builder(
            itemCount: _lista.length,
            itemBuilder: (context, int index){
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      color: Color.fromRGBO(49, 21, 133,1),
                      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      elevation: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: ListTile(
                          onTap: () { Navigator.pushNamed(context, 'detail');},
                          leading: Icon(Icons.view_list, color: Colors.white, size: 48),
                          title: Text(_listaName[index], style: Theme.of(context).textTheme.title.apply(color: Colors.white), overflow: TextOverflow.ellipsis,),
                          subtitle:  Text(_listaCreador[index], style: Theme.of(context).textTheme.subtitle.apply(color: Colors.white)),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12,),
                        ),
                      ),
              ),
                );
            },
      );
  }

  Widget _listaMap(BuildContext context, int index){
        return Container(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                      color: Color.fromRGBO(248,248,248,1),
                      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      elevation: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: ListTile(
                          onTap: () { Navigator.pushNamed(context, 'detail');},
                          leading: Icon(Icons.view_list, color: Colors.blueGrey, size: 48),
                          title: Text(_listaName[index], style: Theme.of(context).textTheme.title.apply(color: Colors.black), overflow: TextOverflow.ellipsis,),
                          subtitle:  Text(_listaCreador[index], style: Theme.of(context).textTheme.subtitle.apply(color: Colors.black)),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.lightBlue, size: 12,),
                        ),
                      ),
              ),
                );
  }

}

