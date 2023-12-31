import 'dart:async';
import 'package:tasklist_api/tasklist_api.dart';

abstract class TaskListApi {
  const TaskListApi();

  Stream<List<Task>> getTasks();
}
