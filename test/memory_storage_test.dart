//  Copyright © 2019 Compass. All rights reserved.

import 'package:flutter_test/flutter_test.dart';
import 'package:storage/memory_storage.dart';

void main() {
  group('Memory Storage', () {
    MemoryStorage storage;

    setUp(() {
      storage = MemoryStorage();
    });

    test('does not exist', () async {
      expect(await storage.exists("test"), false);
    });

    test('can set and get data', () async {
      var key = "dataKey";
      final value = List<int>.generate(10, (i) => i + 1);
      expect(await storage.exists(key), false);
      await storage.setData(key, value);
      expect(await storage.exists(key), true);
      var readData = await storage.getData(key);
      expect(readData, value);
    });

    test('can set and get string', () async {
      var key = "stringKey";
      final value = 'test';
      expect(await storage.exists(key), false);
      await storage.setString(key, value);
      expect(await storage.exists(key), true);
      var readString = await storage.getString(key);
      expect(readString, value);
    });

    test('can set and get int', () async {
      var key = "intKey";
      final value = 1;
      expect(await storage.exists(key), false);
      await storage.setInt(key, value);
      expect(await storage.exists(key), true);
      var readInt = await storage.getInt(key);
      expect(readInt, value);
    });

    test('can set and get double', () async {
      var key = "intKey";
      final value = 1.23;
      expect(await storage.exists(key), false);
      await storage.setDouble(key, value);
      expect(await storage.exists(key), true);
      var readDouble = await storage.getDouble(key);
      expect(readDouble, closeTo(value, 0.1));
    });

    test('can set and get bool', () async {
      var key = "boolKey";
      final value = true;
      expect(await storage.exists(key), false);
      await storage.setBool(key, value);
      expect(await storage.exists(key), true);
      var readBool = await storage.getBool(key);
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
