//  Copyright © 2019 Compass. All rights reserved.

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:storage/file_storage.dart';

void main() {
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

    test('does not exist', () async {
      expect(await storage.exists("test"), false);
    });

    test('returns null for missing items', () async {
      final readString = await storage.getString('missingString');
      expect(null, readString);

      final readInt = await storage.getString('missingInt');
      expect(null, readInt);
    });

    test('can set and get data', () async {
      final key = "dataKey";
      final value = List<int>.generate(10, (i) => i + 1);
      expect(await storage.exists(key), false);
      await storage.setData(key, value);
      expect(await storage.exists(key), true);
      final readData = await storage.getData(key);
      expect(readData, value);
    });

    test('can set and get string', () async {
      final key = "stringKey";
      final value = 'test';
      expect(await storage.exists(key), false);
      await storage.setString(key, value);
      expect(await storage.exists(key), true);
      final readString = await storage.getString(key);
      expect(readString, value);
    });

    test('can set and get int', () async {
      final key = "intKey";
      final value = 1;
      expect(await storage.exists(key), false);
      await storage.setInt(key, value);
      expect(await storage.exists(key), true);
      final readInt = await storage.getInt(key);
      expect(readInt, value);
    });

    test('can set and get double', () async {
      final key = "doubleKey";
      final value = 1.23;
      expect(await storage.exists(key), false);
      await storage.setDouble(key, value);
      expect(await storage.exists(key), true);
      final readDouble = await storage.getDouble(key);
      expect(readDouble, closeTo(value, 0.1));
    });

    test('can set and get bool', () async {
      final key = "boolKey";
      final value = true;
      expect(await storage.exists(key), false);
      await storage.setBool(key, true);
      expect(await storage.exists(key), true);
      final readBool = await storage.getBool(key);
      expect(readBool, value);
    });

    test('can set and get map', () async {
      final key = "mapKey";
      final value = {'hello': 'world'};
      expect(await storage.exists(key), false);
      await storage.setMap(key, value);
      expect(await storage.exists(key), true);
      final readMap = await storage.getMap(key);
      expect(readMap, value);
    });
  });
}
