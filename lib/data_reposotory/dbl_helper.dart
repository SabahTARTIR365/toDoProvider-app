import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_dp_provider_app/models/task_model.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dpHelper = DbHelper._();
  late Database database;
  late String tableName='tasks';
  late String idColumnName='id';
  late String titleColumnName='title';
  late String isCompleteColumnName='isComplete';

  initDataBase()async{
    database= await connectToDatabase();
  }
  Future<Database>connectToDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String folderPath = '${directory.path}/tasks.db';
    return openDatabase(folderPath, version:1, onCreate: (db, v) {
      log('the database is created');
      db.execute('''
  CREATE TABLE $tableName(
   $idColumnName INTEGER primary key autoincrement,
  $titleColumnName varchar(50),
  $isCompleteColumnName INTEGER
)
''');
    }, onOpen: (db) {
      log('the database is connected');
    }, onUpgrade: (db,oldVersion, newVersion){
      // db.delete('tasks');
      db.execute('''
  CREATE TABLE $tableName(
   $idColumnName INTEGER primary key autoincrement,
  $titleColumnName varchar(50),
  $isCompleteColumnName INTEGER
)
''');
      log('table is creadted -test sabah');
    }

    );
  }

 Future<int> insertNewTask(TaskModel taskModel)async {
    int i = await database.insert(tableName,taskModel.toMap());
    return i;
  }

  Future<List<TaskModel>>getAllTasks() async {
    List<Map<String, dynamic>> data = await database.query(tableName);
    return data.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<int> deleteTask(TaskModel taskModel)async
  {
int count=await database.delete(tableName,where: 'id=?',whereArgs: [taskModel.id]);
    return count;

  }
  updateTask(TaskModel taskModel) async{
    bool newValue= !(taskModel.isComplete);
    database.update(tableName, {isCompleteColumnName: newValue},
        where: 'id=?',whereArgs: [taskModel.id]);
  }


}