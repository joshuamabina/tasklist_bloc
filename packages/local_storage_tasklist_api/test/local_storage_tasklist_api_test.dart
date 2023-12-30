import 'package:local_storage_tasklist_api/local_storage_tasklist_api.dart';
import 'package:test/test.dart';

void main() {
  group('Local Storage Api', () {
    final taskList = LocalStorageTaskListApi();

    setUp(() {
      // Additional setup goes here.
    });

    test('can get a stream of tasks', () {
      expect(taskList.getTasks(), returnsNormally);
    });
  });
}
