import 'dart:convert';

import 'package:action_cable_stream/action_cable_stream.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:action_cable_stream/action_cable_stream_states.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MyHomePage(channel: new IOWebSocketChannel.connect("wss://findmyproduct-api.herokuapp.com/api/v1/cable"),
      /*cable: ActionCable.Connect("ws://10.0.2.2:3000/api/v1/cable",onConnected: (){ print('CONECTADO!'); }),*/
      ), 
    );
  }
}

class MyHomePage extends StatefulWidget {
  final WebSocketChannel channel;
  //final ActionCable cable;
  MyHomePage({this.channel, /*this.cable*/});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ActionCable _cable2;
  final String _channel = "List";
  //String actioncableurl = 'ws://10.0.2.2:3000/api/v1/cable';
  String actioncableurl = 'wss://findmyproduct-api.herokuapp.com/api/v1/cable';
  
@override
  void initState() {
    super.initState();
    /*widget.cable.subscribe(
      'pija',
      channelParams: { "room": "private" },
      onMessage: (Map message) {
        print(message);
      }
    );*/

    _cable2 = ActionCable.Stream(actioncableurl);
    _cable2.stream.listen((value) {
        if (value is ActionCableConnected) {
          _cable2.subscribeToChannel(_channel, channelParams: {'room': "private"});
         print('ActionCableConnected');
        } else if (value is ActionCableSubscriptionConfirmed) {
          print('ActionCableSubscriptionConfirmed');
          _cable2.performAction(_channel, 'message',
              channelParams: {'room': "private"},actionParams: {'id': 1});
        } else if (value is ActionCableMessage) {
          print('ActionCableMessage ${jsonEncode(value.message)}');
        }
      });
    
  }

  @override
  void dispose() {
    super.dispose();
    _cable2.disconnect();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('websocket prueba'),),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, AsyncSnapshot snapshot){
                final cosa = jsonEncode(snapshot.data);
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(snapshot.data.toString()),
                  );
              },
            ),

            StreamBuilder(
            stream: _cable2.stream,
            initialData: ActionCableInitial(),
            builder: (context, AsyncSnapshot<ActionCableDataState> snapshot) {
              final state = snapshot.data;
              return Center(child: buildBody(snapshot));
              //return Text('Message received ${jsonEncode(state.message)}');
            }
          ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           /*widget.cable.performAction(
              "pija",
              action: "send_message",
              channelParams: { "room": "private" },
              actionParams: { "message": "Hello private peeps! 😜" }
            );*/
            _cable2.performAction(_channel, 'message',
              channelParams: {'room': "private"});
        }
        ),
    );
  }

   Widget buildBody(AsyncSnapshot<ActionCableDataState> snapshot) {
    final state = snapshot.data;

    if (state is ActionCableInitial ||
        state is ActionCableConnectionLoading ||
        state is ActionCableSubscribeLoading) {
      return Center(child: CircularProgressIndicator(),);
    } else if (state is ActionCableError) {
      return Text('Error... ${state.message}');
    } else if (state is ActionCableSubscriptionConfirmed) {
      return Text('Subscription confirmed');
    } else if (state is ActionCableSubscriptionRejected) {
      return Text('Subscription rejected');
    } else if (state is ActionCableMessage) {
      return Text('Message received ${jsonEncode(state.message)}');
    } else if (state is ActionCableDisconnected) {
      return Text('Disconnected');
    } else {
      return Text('Something went wrong');
    }
  }


  

}