//  Copyright © 2019 Compass. All rights reserved.

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:storage/storage.dart';
import 'package:test_api/test_api.dart';
import 'package:uuid/uuid.dart';

void main() {
  final testData = List<int>.generate(10, (i) => i + 1);
  String mockPath;
  Map<String, dynamic> preferences = {};

  const MethodChannel('plugins.flutter.io/path_provider')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    return mockPath;
  });

  const MethodChannel('plugins.flutter.io/shared_preferences')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return preferences;
    }
    return null;
  });

  group('Storage', () {
    test('is not configured', () {
      Storage.resetConfiguration();
      expect(Storage.isConfigured, false);
    });

    test('configure without test', () async {
      Storage.resetConfiguration();
      final mockDirectory =
          await Directory.systemTemp.createTemp('__mock_directory__');
      mockPath = mockDirectory.path;
      expect(await Storage.configure(testing: false), true);
    });

    group('FileStorage', () {
      test('throws if not configured', () {
        Storage.resetConfiguration();
        expect(() => Storage.file.get('test'), throwsStateError);
      });

      test('can set and get', () async {
        final key = Uuid().v4();

        await Storage.configure(testing: true);
        expect(await Storage.file.get(key), null);
        await Storage.file.set(key, testData);
        expect(await Storage.file.get(key), testData);
      });
    });

    group('MemoryStorage', () {
      test('throws if not configured', () {
        Storage.resetConfiguration();
        expect(() => Storage.memory.get('test'), throwsStateError);
      });

      test('can set and get', () async {
        final key = Uuid().v4();

        await Storage.configure(testing: true);
        expect(await Storage.memory.get(key), null);
        await Storage.memory.set(key, testData);
        expect(await Storage.memory.get(key), testData);
      });
    });

    group('Preferences', () {
      test('throws if not configured', () {
        Storage.resetConfiguration();
        expect(() => Storage.preferences.get('test'), throwsStateError);
      });

      test('can set and get', () async {
        final key = Uuid().v4();

        await Storage.configure(testing: true);
        expect(await Storage.preferences.get(key), null);
        await Storage.preferences.set(key, testData);
        expect(await Storage.preferences.get(key), testData);
      });
    });
  });
}
