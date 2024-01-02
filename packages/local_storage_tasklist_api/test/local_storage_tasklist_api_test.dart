import 'package:local_storage_tasklist_api/local_storage_tasklist_api.dart';
import 'package:tasklist_api/tasklist_api.dart';
import 'package:test/test.dart';

void main() {
  // TODO: Rename to DB Api
  group('Local Storage Api', () {
      final localStorageApi = LocalStorageTaskListApi();

    setUp(() {
      // Additional setup goes here.
    });

    test('Can get a list of tasks', () {
      final result = <Task>[];

      expect(localStorageApi.getTasks(), equals(result));
    });
  });
}
