import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://img.vixdata.io/pd/jpg-large/es/sites/default/files/r/rip-stan-lee.jpg'),
              radius: 15.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0,),
            child: CircleAvatar(
              child: Text('SL'),
              backgroundColor: Colors.black,
            ),
          )
        ],
      ),
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: EdgeInsets.only(right: 10,left: 10),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: FadeInImage(image: NetworkImage('https://img.vixdata.io/pd/jpg-large/es/sites/default/files/r/rip-stan-lee.jpg'),
            placeholder: AssetImage('data/assets/jar-loading.gif'),
            fit: BoxFit.cover,
            //width: 550,
            ),
          ),
        ),
        ),
      );
  }
}