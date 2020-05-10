import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
            _pagina1(),
            _pagina2(),
        ],
        ),
    );
  }

  Widget _pagina1(){
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ],
    );
  }

  Widget _colorFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromARGB(188, 192, 218, 1),
    );
  }

  Widget _imagenFondo(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(image: AssetImage('assets/scroll.png'), fit: BoxFit.cover,),
    );
  }

  Widget _textos(){
    return SafeArea(
          child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text('11', style: TextStyle(fontSize: 20, color: Colors.white),),
          Text('Miércoles', style: TextStyle(fontSize: 20, color: Colors.white),),
          Expanded(child: Container()),
          Icon(Icons.arrow_downward, size: 70, color: Colors.black,)

        ],
      ),
    );
  }

  Widget _pagina2(){
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.amber,
      child: Center(
        child: RaisedButton(
          child: Text('Bienveidos', style: TextStyle(fontSize: 36)),
          shape: StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          color: Colors.indigo,
          textColor: Colors.white,
          onPressed: (){

          },
        ),
      ),
    );
  }
}