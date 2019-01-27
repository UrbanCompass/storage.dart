//  Copyright © 2019 Compass. All rights reserved.

import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/preferences_storage.dart';
import 'package:test_api/test_api.dart';

void main() {
  final data = List<int>.generate(10, (i) => i + 1);
  Map<String, dynamic> preferences = {};

  const MethodChannel('plugins.flutter.io/shared_preferences')
      .setMockMethodCallHandler((MethodCall methodCall) async {
    if (methodCall.method == 'getAll') {
      return preferences;
    }
    return null;
  });

  group('Preferences Storage', () {
    PreferencesStorage storage;

    setUpAll(() async {
      storage =
          PreferencesStorage(prefs: await SharedPreferences.getInstance());
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
