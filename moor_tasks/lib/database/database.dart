
import 'package:moor_flutter/moor_flutter.dart';


part 'database.g.dart'; 

// Por si queremos cambiar el nombre, pero por defecto sera el singular de Tasks => Task
//@DataClassName('Task')
class Tasks extends Table {

  //toda columna es un getter en la clase
  //necesita el call porque vamos a transformae el ColumnBuilder en una cokumna
  // el autoincrement hace que lo tome como el id
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();


// Para setear primary keys

}




@UseMoor(tables: [Tasks], daos: [TaskDao])
//Toda DB debe ser anotada con UseMoor
//@UseMoor(tables: [Tasks], daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
    AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: false));

    @override
    int get schemaVersion => 1;


   /* Future<List<Task>> getAllTasks() => select(tasks).get();
    Stream<List<Task>> watchAllTasks() => select(tasks).watch();

    Future inserTask(Task task) => into(tasks).insert(task);
    Future updateTask(Task task) => update(tasks).replace(task);

    Future deleteTask(Task task) => delete(tasks).delete(task);
*/ 
}

/*
@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  TaskDao(this.db) : super(db);

   Future<List<Task>> getAllTasks() => select(tasks).get();
    // Asi las da todas
    // Stream<List<Task>> watchAllTasks() => select(tasks).watch();

    Stream<List<Task>> watchAllTasks() {
       // Si usamos .. podemos anidar los resultados
       /*return select(tasks)
       ..orderBy()
       ..where()
       ..limit(limit)*/
       return (select(tasks)
       ..orderBy([
         (ts) => OrderingTerm(expression: ts.dueDate, mode: OrderingMode.desc),
         (ts) => OrderingTerm(expression: ts.name, mode: OrderingMode.asc)
       ])
       )
       .watch();
    }

    Stream<List<Task>> watchCompletedTasks() {
       return (select(tasks)
       ..orderBy([
         (ts) => OrderingTerm(expression: ts.dueDate, mode: OrderingMode.desc),
         (ts) => OrderingTerm(expression: ts.name, mode: OrderingMode.asc)
       ])
       ..where((t) => t.completed.equals(true))
       )
       .watch();
    }

    // Antes en lugar de Insertable<Task> solo era Task
    Future inserTask(Insertable<Task> task) => into(tasks).insert(task);
    Future updateTask(Insertable<Task> task) => update(tasks).replace(task);

    Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}*/


@UseDao(tables: [Tasks])
class TaskDao extends DatabaseAccessor<AppDatabase> with _$TaskDaoMixin {
  final AppDatabase db;

  // Called by the AppDatabase class
  TaskDao(this.db) : super(db);

  Future<List<Task>> getAllTasks() => select(tasks).get();
 Stream<List<Task>> watchAllTasks() {
  // Wrap the whole select statement in parenthesis
  return (select(tasks)
        ..orderBy(
          ([
            // Primary sorting by due date
            (t) =>
                OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
            // Secondary alphabetical sorting
            (t) => OrderingTerm(expression: t.name),
          ]),
        ))
      // watch the whole select statement
      .watch();
}
Stream<List<Task>> watchCompletedTasks() {
  // where returns void, need to use the cascading operator
  return (select(tasks)
        ..orderBy(
          ([
            // Primary sorting by due date
            (t) =>
                OrderingTerm(expression: t.dueDate, mode: OrderingMode.desc),
           // Secondary alphabetical sorting
            (t) => OrderingTerm(expression: t.name),
          ]),
        )
        ..where((t) => t.completed.equals(true)))
      .watch();
}
  Future insertTask(Insertable<Task> task) => into(tasks).insert(task);
  Future updateTask(Insertable<Task> task) => update(tasks).replace(task);
  Future deleteTask(Insertable<Task> task) => delete(tasks).delete(task);
}

//Para generar la DB, corremos en la terminal
// flutter packages pub run build_runner watch 