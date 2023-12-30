import 'package:local_storage_tasklist_api/local_storage_tasklist_api.dart';
import 'package:test/test.dart';

void main() {
  group('Local Storage Task List Api', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
