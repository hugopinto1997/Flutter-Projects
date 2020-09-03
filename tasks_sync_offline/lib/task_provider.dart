
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:tasks_sync_offline/database/database.dart';

class TaskProvider {
  String _url = 'https://tasks-cugoapi.herokuapp.com/api/v1/tasks.json';


 Future<List<Task>> getTasks() async {
     final resp = await http.get(_url);
     List bod = json.decode(resp.body)['tasks'];
     List<Task> t = new List();
     
     bod.forEach((element) { 
       t.add(new Task(id: element['id'], name: element['name'], completed: element['completed']));
     });

     return t;
  }


}