import 'package:tasklist_api/tasklist_api.dart';

abstract class TaskListApi {
  const TaskListApi();

  List<Task> getTasks();
}
