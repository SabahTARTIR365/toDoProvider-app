import 'package:todo_dp_provider_app/data_reposotory/dbl_helper.dart';

class TaskModel {
  late int id;
  late String title;
  late bool isComplete;
  TaskModel(this.title, this.isComplete);
  TaskModel.fromMap(Map map) {
    id= map[DbHelper.dpHelper.idColumnName];
    title = map[DbHelper.dpHelper.titleColumnName];
    isComplete = map[DbHelper.dpHelper.isCompleteColumnName] == 1
        ? true
        : false;
  }
  toMap() {
    return {
      DbHelper.dpHelper.idColumnName: id,
      DbHelper.dpHelper.titleColumnName: title,
      DbHelper.dpHelper.isCompleteColumnName: isComplete
    };
  }
}