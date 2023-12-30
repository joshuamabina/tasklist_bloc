import 'dart:async';
import 'package:tasklist_api/tasklist_api.dart';
import 'package:test/test.dart';


class TestTaskListApi extends TaskListApi {
  Stream<List<Task>> getTasks() {
    return StreamController<List<Task>>().stream;
  } 
}

void main() {
  group('Task List Api', () {
      setUp(() {
          // Additional setup goes here.
          });

      test('Can be created', () {
          expect(TestTaskListApi.new, returnsNormally);
          });
      });
}
