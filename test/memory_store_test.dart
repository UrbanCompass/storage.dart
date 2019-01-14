import 'package:storage/memory_store.dart';
import 'package:test_api/test_api.dart';

void main() {
  group('Memory Store', () {
    MemoryStore store;

    setUpAll(() async {
      store = MemoryStore();
    });

    test('does not exist', () {
      expect(store.exists("test"), false);
    });

    test('can set', () async {
      var key = "setKey";
      expect(store.exists(key), false);
      await store.set(key, List<int>(8));
      expect(store.exists(key), true);
    });

    test('can set and get', () async {
      var key = "setAndGetKey";
      var data = List<int>(8);
      await store.set(key, data);
      var readData = await store.get(key);
      expect(data, readData);
    });
  });
}
