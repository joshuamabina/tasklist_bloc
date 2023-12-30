import 'package:tasklist_api/tasklist_api.dart';
import 'package:test/test.dart';

void main() {
  group('Task List Api', () {
    final taskListApi = TaskListApi();

    setUp(() {
      // Additional setup goes here.
    });

    test('Can get all tasks', () {
      expect(taskListApi.getTasks(), equals([]));
    });
  });
}
