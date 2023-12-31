import 'dart:async';

import 'package:local_storage_tasklist_api/local_storage_tasklist_api.dart';
import 'package:tasklist_api/tasklist_api.dart';
import 'package:test/test.dart';

void main() {
  group('Local Storage Api', () {
      final localStorageApi = LocalStorageTaskListApi();

    setUp(() {
      // Additional setup goes here.
    });

    test('Can get a stream of tasks', () async {
      final result = <Task>[];

      expect(localStorageApi.getTasks(), emits(result));
    });
  });
}
