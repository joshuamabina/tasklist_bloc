import 'dart:math';
import 'dart:async';
import 'package:tasklist_api/tasklist_api.dart';

class LocalStorageTaskListApi extends TaskListApi {
  LocalStorageTaskListApi();

  Stream<List<Task>> getTasks() {
    return StreamController<List<Task>>().stream;
  }
}
