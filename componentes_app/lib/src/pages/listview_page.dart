import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();


  //al crearse la pagina 
  @override
  void initState() {
    super.initState();
    _crear10();
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        //_crear10();

        _fetchData();
      }
    });
  }

  //al destruirse la pagina
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Builder Page'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(28, 2, 77, 100),
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
    );
  }

  Widget _crearLista(){
    
    return RefreshIndicator(
      onRefresh: _obtenerPagina1,
          child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index){

          final _imagen = _listaNumeros[index];

           return FadeInImage(
             image: NetworkImage('https://picsum.photos/500/300/?image=$_imagen'),
             placeholder: AssetImage('data/assets/jar-loading.gif'),

           );
        },
        itemCount: _listaNumeros.length,
        

        ),
    );
  }

  Future _fetchData() async {
     _isLoading = true;
     setState(() {});
     Duration _duration = new Duration(seconds: 2);
     return new Timer(_duration, respuestaHTTP);
     
  }

  void respuestaHTTP(){
    _isLoading = false;
    _crear10();
    _scrollController.animateTo(_scrollController.position.pixels+100, duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  void _crear10(){
      for (var i = 1; i < 10; i++) {
        _ultimoItem++;
        _listaNumeros.add(_ultimoItem);
      }
      setState(() {
        
      });
  }

  Future<Null> _obtenerPagina1() async{
    final _duration2 = new Duration(seconds: 2);
    Timer(_duration2, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _crear10();

    });

    return Future.delayed(_duration2);
  }

  Widget _crearLoading(){
    if(_isLoading){
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(

              ),
              SizedBox(height: 15.0,),
            ],
          ),
        ],
      );
    }else{
      return Container();
    }
  }
}