import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:tasklist_api/tasklist_api.dart';
import 'package:tasklist_repository/tasklist_repository.dart';

class MockApi extends Mock implements TaskListApi {}

void main() {
  group('Task List Repository', () {
    final api = MockApi();

    final taskList = TaskListRepository(taskListApi: api);

    test('Can get an empty list of tasks from api', () {
      final List<Task> result = <Task>[];

      expect(taskList.getTasks(), equals(result));
    });
  });
}
