import 'package:tasklist_api/tasklist_api.dart';

class TaskListRepository {
  const TaskListRepository({
    required TaskListApi taskListApi,
  }) : _taskListApi = taskListApi;

  final TaskListApi _taskListApi;

  List<Task> getTasks() => _taskListApi.getTasks();
}
