//  Copyright © 2019 Compass. All rights reserved.

import 'dart:io';

import 'package:storage/file_storage.dart';
import 'package:test_api/test_api.dart';

void main() {
  final data = List<int>.generate(10, (i) => i + 1);

  group('File Storage', () {
    FileStorage storage;
    Directory tempDirectory;

    setUpAll(() async {
      tempDirectory =
          await Directory.systemTemp.createTemp('__file_storage_test__');
      storage = FileStorage(tempDirectory.path);
    });

    tearDownAll(() async {
      tempDirectory.delete(recursive: true);
    });

    test('does not exist', () {
      expect(storage.exists("test"), false);
    });

    test('can set', () async {
      var key = "setKey";
      expect(storage.exists(key), false);
      await storage.set(key, data);
      expect(storage.exists(key), true);
    });

    test('can set and get', () async {
      var key = "setAndGetKey";
      await storage.set(key, data);
      var readData = await storage.get(key);
      expect(data, readData);
    });
  });
}
