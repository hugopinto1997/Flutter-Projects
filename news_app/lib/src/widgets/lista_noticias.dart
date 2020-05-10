import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:news_app/src/theme/dark_theme.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (context, int index){
        return _Noticia(noticia: noticias[index], index: index,);
      },
      );
  }
}

class _Noticia extends StatelessWidget {

final Article noticia;
final int index;

  const _Noticia({ @required this.noticia, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia: noticia, index: index,),
        _TarjetaTituloNoticia(noticia: noticia,),
        _TarjetaImagen(noticia: noticia,),
        _TarjetaBody(noticia: noticia),
        SizedBox(height: 10,),
        Divider(),
        _TarjetaBotones(),

      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar({ @required this.noticia, @required this.index});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text('${index + 1}. ',style: TextStyle(color: darkTheme.accentColor),),
          Text('${noticia.source.name}. ',style: TextStyle(color: darkTheme.accentColor),),
        ],
      ),
    );
  }
}

class _TarjetaTituloNoticia extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTituloNoticia({@required this.noticia});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {

  final Article noticia;

  const _TarjetaImagen({@required this.noticia});



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only( topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
            child: Container(
          child: (noticia.urlToImage != null) ?
          FadeInImage(placeholder: AssetImage('assets/giphy.gif'), image: NetworkImage(noticia.urlToImage))
          : Image(image: AssetImage('assets/no-image.png'))
          ,
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  

  final Article noticia;

  const _TarjetaBody({ this.noticia});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20              ),
      child: (noticia.description != null) ? Text(noticia.description) : Text('Sin descripción'),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(onPressed: (){}, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: darkTheme.accentColor,
          child: Icon(Icons.star_border),
          ),
          SizedBox(width: 10,),
          RawMaterialButton(onPressed: (){}, 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.blueGrey,
          child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}