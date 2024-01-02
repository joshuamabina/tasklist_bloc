import 'package:tasklist_api/tasklist_api.dart';
import 'package:test/test.dart';


class TestTaskListApi extends TaskListApi {
  List<Task> getTasks() {
    return <Task>[];
  } 
}

void main() {
  group('Task List Api', () {
      setUp(() {});

      test('Can be created', () {
          expect(TestTaskListApi.new, returnsNormally);
          });
      });
}
