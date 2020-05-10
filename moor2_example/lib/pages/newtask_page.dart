import 'package:flutter/material.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:moor2_example/data/database.dart';
import 'package:provider/provider.dart';

class NewTaskInput extends StatefulWidget {
  NewTaskInput({Key key}) : super(key: key);

  @override
  _NewTaskInputState createState() => _NewTaskInputState();
}

class _NewTaskInputState extends State<NewTaskInput> {

  DateTime newTaskDate;
  TextEditingController controller;
  String _texto;

  @override
  void initState() { 
    super.initState();
    controller = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildTextField(context),
              _buildDateButton(context),   
            ],
          ),
          SizedBox(height: 10,),
          _buttons(context),
        ],
      ),
    );
  }

  Expanded _buildTextField(BuildContext context){
    return Expanded(
    child: TextField(
      controller: controller,
      decoration: InputDecoration(hintText: 'Task Name'),
      onChanged: (texto2){
        setState(() {
          _texto = texto2;
        });
      },
      onSubmitted: (inputName) {
        
      },
    ),
  );
  }

Widget _buttons (BuildContext context){
    return Container(
      padding: EdgeInsets.only(top: 10,),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
           FlatButton(
               child: Text('CANCELAR'),
               onPressed: (){
                  Navigator.of(context).pop();
               },
               ),
                FlatButton(
               child: Text('OK'),
               onPressed: (){
                 final dao = Provider.of<AppDatabase>(context);
        final task = TasksCompanion(
          name: moor.Value(_texto),
          dueDate: moor.Value(newTaskDate),
        );
        dao.insertTask(task);
        resetValues();
        Navigator.of(context).pop();

               },
            ),
        ],
      ),
    );
}

  IconButton _buildDateButton(BuildContext context){
    return IconButton(
      icon: Icon(Icons.calendar_today),
      onPressed: () async {
        newTaskDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1999),
          lastDate: DateTime(2099),
          );
      },
      );
  }

  void resetValues(){
    setState(() {
      newTaskDate = null;
      controller.clear();
    });
  }
}