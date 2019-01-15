//  Copyright © 2019 Compass. All rights reserved.

import 'package:storage/memory_storage.dart';
import 'package:test_api/test_api.dart';

void main() {
  group('Memory Storage', () {
    MemoryStorage store;

    setUpAll(() async {
      store = MemoryStorage();
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
