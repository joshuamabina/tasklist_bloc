import 'package:tasklist_api/tasklist_api.dart';

/* TODO: Rename to DBApi */
class LocalStorageTaskListApi extends TaskListApi {
  LocalStorageTaskListApi();

  List<Task> getTasks() => <Task>[];
}
