import 'package:flutter_test/flutter_test.dart';
import 'package:storage/mocks/mock_secure.dart';

void main() {
  group('File Storage', () {
    MockSecure secure;
    final key = 'hello';
    final value = 'world';

    setUp(() async {
      secure = MockSecure();
      await secure.write(key: key, value: value);
    });

    test('read', () async {
      expect(value, await secure.read(key: key));
    });

    test('readAll', () async {
      expect({key: value}, await secure.readAll());
    });

    test('delete', () async {
      await secure.delete(key: key);
      expect({}, await secure.readAll());
    });

    test('deleteAll', () async {
      await secure.write(key: 'random', value: 'data');
      await secure.deleteAll();
      expect({}, await secure.readAll());
    });
  });
}
