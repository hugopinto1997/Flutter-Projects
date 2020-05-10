import 'package:flutter/material.dart';

class ContactosPage extends StatefulWidget {
  ContactosPage({Key key}) : super(key: key);

  @override
  _ContactosPageState createState() => _ContactosPageState();
}

class _ContactosPageState extends State<ContactosPage> {
  List<int> _lista = [1,2,3,4,5,6,7,8];
  List<String> _listaName = [
    'Mamá Carmen',
    'Niña Mary',
    'Hermano José',
    'Doña Lucina',
    'John Sina',
    'Niña Lolita',
    'Papa Juan',
    'Don Pepe',

  ];

List<String> _listaCreador = [
    'MC',
    'NM',
    'HJ',
    'DL',
    'JS',
    'NL',
    'PJ',
    'DP',
  ];
  int _index = 2;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 248, 248,1),
        title: Text('Contactos', style: Theme.of(context).textTheme.title.apply(color:Colors.black),),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search, color: Colors.black,),
          ),
        ],
        ),
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
            icon: Icon(Icons.home,),
            title: Container(),
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt,),
            title: Container(),
            ),
            BottomNavigationBarItem(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.blueAccent,
                child: Icon(Icons.contacts),
              ),
              ),
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
          backgroundColor: Colors.blue,
          onPressed: () {},
          child: Icon(Icons.add),
          ),

    );
  }



  Widget _pantalla(){
    return Container(
          //padding: EdgeInsets.only(top: 10, left: 20),
         //width: double.infinity,
          //color: Colors.black,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            /*Container(
              //width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                  color: Color.fromRGBO(81, 38, 209,1),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical:10),
                  child: Text('Tus listas ', style: Theme.of(context).textTheme.title.apply(fontSizeDelta: 6, color: Colors.white), textAlign: TextAlign.center,)),
              ),
            ),
             SizedBox(height: 20,),*/
            _crearLista(context),
            
          ],
      ),
    );
  }

  Widget _fondo(){
    return Container(width: double.infinity, height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [Color.fromRGBO(248, 248, 248,1), Color.fromRGBO(255,255,255,1)],
        begin: FractionalOffset(0.0, 0.1),
        end: FractionalOffset(0.0, 1.0),
        ),
    ),
    );
  }

  Widget _crearLista(BuildContext context){
    return Expanded(
      child: ListView.builder(
            itemCount: _lista.length,
            itemBuilder: (context, int index){
                return Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          color: Color.fromRGBO(255,255,255,1),
                          elevation: 1.0,
                          child: ClipRRect(
                            //borderRadius: BorderRadius.circular(0),
                              child: ListTile(
                              
                              onTap: () { Navigator.pushNamed(context, 'detail');},
                              leading: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Text(_listaCreador[index], style: TextStyle(color: Colors.white),),
                              ),
                              title: Text(_listaName[index], style: Theme.of(context).textTheme.title.apply(color: Colors.black), overflow: TextOverflow.ellipsis,),
                             
                            ),
                          ),
              ),
                    ),
                    
                      //Divider(color: Colors.black, thickness: 0.5, ),
                  ],
                );
            },
      ),
    );
  }
}