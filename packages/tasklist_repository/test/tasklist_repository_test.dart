import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:tasklist_api/tasklist_api.dart';
import 'package:tasklist_repository/tasklist_repository.dart';

class TestApi extends Mock implements TaskListApi {}

void main() {
  group('Task List Repository', () {
    final api = TestApi();

    final taskList = TaskListRepository(taskListApi: api);

    setUp(() {
        when(() => api.getTasks()).thenAnswer((_) => <Task>[]);
    });

    test('can get an empty list of tasks from api', () {
      final List<Task> result = <Task>[];

      expect(taskList.getTasks(), equals(result));
    });
  });
}
