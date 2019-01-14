import 'dart:io';

import 'package:storage/file_store.dart';
import 'package:test_api/test_api.dart';

void main() {
  final data = List<int>.generate(10, (i) => i + 1);

  group('File Store', () {
    FileStore store;
    Directory tempDirectory;

    setUpAll(() async {
      tempDirectory =
          await Directory.systemTemp.createTemp('__file_storage_test__');
      store = FileStore(tempDirectory.path);
    });

    tearDownAll(() async {
      tempDirectory.delete(recursive: true);
    });

    test('does not exist', () {
      expect(store.exists("test"), false);
    });

    test('can set', () async {
      var key = "setKey";
      expect(store.exists(key), false);
      await store.set(key, data);
      expect(store.exists(key), true);
    });

    test('can set and get', () async {
      var key = "setAndGetKey";
      await store.set(key, data);
      var readData = await store.get(key);
      expect(data, readData);
    });
  });
}
