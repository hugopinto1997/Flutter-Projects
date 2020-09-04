import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tasks_sync_offline/database/database.dart';
import 'package:provider/provider.dart';
import 'package:tasks_sync_offline/internet_provider.dart';
import 'package:tasks_sync_offline/task_provider.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;


import 'internet_widget.dart';
import 'newtask_page.dart';


class HomePage extends StatefulWidget {

final bool estado;

  HomePage({this.estado});
    
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showCompleted = false;
  TaskProvider tp = new TaskProvider();


  @override
  Widget build(BuildContext context) {
    final ip = Provider.of<InternetProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text('Tasks'),
          centerTitle: true,
          //backgroundColor: Theme.of(context).bottomAppBarColor,
          actions: <Widget>[
            //_buildSettings(context),
            IconButton(icon: Icon(Icons.delete), onPressed: (!ip.internet) ? null : (){
              final td = Provider.of<TaskDao>(context, listen: false);
              td.truncateTasks();
            }),
            IconButton(icon: Icon(Icons.file_download), onPressed: (!ip.internet) ? null :  (){
              _downloadTasks(context);
            })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             InternetWidget(),
            _buildCompletedOnlySwitch(),            
            Expanded(child: 
            _buildTaskList(context),
            ),
            //NewTaskInput(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _addDialog(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
          ),
        );
  }

  void _downloadTasks(BuildContext context) async {
    final dao = Provider.of<TaskDao>(context, listen: false);
    final List<Task> tareas = await tp.getTasks();
    dao.truncateTasks();
    tareas.forEach((element) {
         final task = TasksCompanion(
          name: moor.Value(element.name),
          id: moor.Value(element.id),
          completed: moor.Value(element.completed),
          dueDate: moor.Value(element.dueDate)
        );
        dao.insertTask(task);
     });
  }

  Widget _buildSettings(BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(icon: Icon(Icons.settings), onPressed: (){
        _showSettings(context);
      }),
    );
  }

  Row _buildCompletedOnlySwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text('Completed only'),
        Switch(
          value: showCompleted,
          activeColor: Colors.white,
          onChanged: (newValue) {
            setState(() {
              showCompleted = newValue;
            });
          },
        ),
      ],
    );
  }

  StreamBuilder<List<Task>> _buildTaskList(BuildContext context) {
    final dao = Provider.of<TaskDao>(context);
    return StreamBuilder(
      stream: showCompleted ? dao.watchCompletedTasks() : dao.watchAllTasks(),
     // initialData: List(),
      builder: (context, AsyncSnapshot<List<Task>> snapshot) {
        final tasks = snapshot.data ?? List();
        if(snapshot.hasData){
           return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, dao);
          },
        );
        }else{
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.white,),);
        }
      },
    );
  }

  Widget _buildSlidableItem(Task itemTask, TaskDao dao){
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => dao.deleteTask(itemTask),
        )
      ],
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        //color: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        elevation: 5.0,
        child: CheckboxListTile(
          title: Text(itemTask.name),
          subtitle: Text(itemTask.dueDate?.toString() ?? 'No date'),
          value: itemTask.completed,
          onChanged: (newValue) {
                dao.updateTask(itemTask.copyWith(completed: newValue));
              },
        ),
      ),
    );
  }

  Widget _buildListItem(Task itemTask, TaskDao dao) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.black,
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
              child: _buildSlidableItem(itemTask, dao) ,
      ),
    );
  }


  void _addDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Add a new task'),
            content: NewTaskInput(),
          );
      },
    );
  }


  void _showSettings(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text('Settings', style: Theme.of(context).textTheme.title,),
            content: SwitchDark(),
          );
      },
    );
  }
}


class SwitchDark extends StatefulWidget {

  @override
  _SwitchDarkState createState() => _SwitchDarkState();
}

class _SwitchDarkState extends State<SwitchDark> {

  bool _darkMode = false;

  @override
  void initState() { 
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
              value: _darkMode,
              title: Text('Dark Mode'),
              subtitle: Text('Turn on the switch to enable the dark mode of the app'), 
              onChanged: (val){
                setState(() {
                  _darkMode = val;
                });
              },
            );
  }



}