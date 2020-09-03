import 'package:moor_flutter/moor_flutter.dart';


part 'database.g.dart'; 


class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  DateTimeColumn get dueDate => dateTime().nullable()();
  BoolColumn get completed => boolean().withDefault(Constant(false))();
}

@UseMoor(tables: [Tasks], daos: [TaskDao])
class AppDatabase extends _$AppDatabase {
    AppDatabase() : super(FlutterQueryExecutor.inDatabaseFolder(path: 'db.sqlite', logStatements: false));

    @override
    int get schemaVersion => 1;

}

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
  Future truncateTasks() => delete(tasks).go();
}