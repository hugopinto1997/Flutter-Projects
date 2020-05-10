import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

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

  List<String> _fotos = [
    'https://www.postconsumerbrands.com/wp-content/uploads/2019/11/Post_Hostess_Twinkies_Cereal_Box.jpg?fbclid=IwAR01YBS7woWDTmk2CZt_klrvI3NWT0c65pQAUBiTCyG2f3QLrcY9BrN_EMw',
    'https://www.nestle-centroamerica.com/sites/g/files/pydnoa521/files/asset-library/publishingimages/marcas/musun1.jpg',
    'https://static.wixstatic.com/media/32e401_840022c67be64ed68a33b34a4e9eae84~mv2.png/v1/fit/w_500,h_500,q_90/file.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            _crearAppBar(),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  SizedBox(height: 5.0,),
                  _posterTitulo(context),
                  //_crearLista(context, 'Café Musún', _fotos[0]),
                  _crearLista2(context, 'Cornflakes Twinkles', _fotos[0]),
                  _crearLista2(context, 'Café Musún', _fotos[1]),
                  _crearLista2(context, 'Leche Salud', _fotos[2]),

                           
                ]
              ),
              )
          ],
          ),
    );
  }

  Widget _crearAppBar(){
      return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.blueGrey,
        expandedHeight: 200.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('data/assets/no-image.jpg'),
            image: NetworkImage('https://cdn-ep19.pressidium.com/wp-content/uploads/2018/10/photoshop-collage-muang-mai-markets.jpg')),
          title: Text(
            'Lista de Walmart',
            overflow: TextOverflow.ellipsis,maxLines: 1,
            style: TextStyle(fontSize: 16.0,
           ),
          ),
          titlePadding: EdgeInsets.only(right: 80, left:80, bottom:15),
        ),
      );
  }

  Widget _posterTitulo(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  placeholder: AssetImage('data/assets/no-image.jpg'),
                  image: NetworkImage('https://previews.123rf.com/images/val2014/val20141603/val2014160300006/54302308-shopping-cart-icon.jpg'),
                 height: 80.0,
                ),
            ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Lista de articulos',
                style: Theme.of(context).textTheme.title,),
                 Text('Detalles',
                 overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle,),

                Text('Precio estimado: \$ 224.85',
                 overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subhead,),

                Row(
                  children: <Widget>[
                    Icon(Icons.add_shopping_cart, size: 25,),
                    SizedBox(width: 2,height:40),
                    Text(
                      '25 artículos seleccionados', 
                      style: TextStyle(fontSize: 16),
                      )
                  ],
                  ),
              ],),
          ),
        ],
      ),
    );
  }

   Widget _posterTitulo2(BuildContext context,String nombre, String imagen){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: FadeInImage(
                      placeholder: AssetImage('data/assets/no-image.jpg'),
                      image: NetworkImage(imagen),
                     height: 150.0, width:90,
                    ),
                ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(nombre,
                    style: Theme.of(context).textTheme.title.apply(color: Colors.white),),
                     Text('Cantidad: 1',
                     overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle.apply(color:Colors.white),),

                    Text('Descripción: De este solo traiga el del paquete que trae los 2 grandes',
                     overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.subhead.apply(color:Colors.white),),


                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money, size: 25,color: Colors.white,),
                        SizedBox(width: 2,height:40),
                        Text(
                          '2.50', 
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          )
                      ],
                      ),

                     
                      
                  ],

                  ),
              ),
            ],
          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                    Expanded(
                                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),        
                        child: FlatButton(onPressed: () { }, 
                        child: Text('Quitar', style: TextStyle(color: Colors.white),),
                        color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),

                     Expanded(
                                            child: ClipRRect(
                         borderRadius: BorderRadius.circular(25),
                         child: FlatButton(
                           onPressed: () { }, 
                    child: Text('Comprado', style: TextStyle(color: Colors.white),),
                    color: Colors.greenAccent,
                    ),
                       ),
                     )
                  ],
                  ),
        ],
      ),
    );
  }

 


  Widget _crearLista(BuildContext context, String nombre, String imagen){
    return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(49, 21, 133,1),
                      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      elevation: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: ListTile(
                          //onTap: () { Navigator.pushNamed(context, 'detail');},
                          leading: FadeInImage(placeholder: AssetImage('data/assets/no-image.jpg'), image: NetworkImage(imagen),width:100, height:200,fit: BoxFit.cover,),
                          title: Text(nombre, style: Theme.of(context).textTheme.title.apply(color: Colors.white), overflow: TextOverflow.ellipsis,),
                          subtitle: Column(children: <Widget>[
                            Text('fffff', style: Theme.of(context).textTheme.subtitle.apply(color: Colors.white)),
                            Text('fffff', style: Theme.of(context).textTheme.subtitle.apply(color: Colors.white)),
                            Text('fffff', style: Theme.of(context).textTheme.subtitle.apply(color: Colors.white)),Text('fffff', style: Theme.of(context).textTheme.subtitle.apply(color: Colors.white))
                          ],),
                          trailing: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 12,),
                        ),
                      ),
              ),
                );
  }

  Widget _crearLista2(BuildContext context, String nombre, String imagen){
    return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      color: Color.fromRGBO(49, 21, 133,1),
                      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
                      elevation: 5.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                          child: _posterTitulo2(context,nombre, imagen),
                      ),
              ),
                );
  }


}