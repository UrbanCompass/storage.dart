//  Copyright © 2019 Compass. All rights reserved.

import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage_container.dart';

class PreferencesStorage extends StorageContainer {
  final SharedPreferences prefs;

  PreferencesStorage({@required this.prefs});

  @override
  bool exists(String key) {
    return prefs.getKeys().contains(key);
  }

  @override
  Future<List<int>> get(String key) async {
    final value = await prefs.get(key);
    return (value == null) ? null : utf8.encode(value);
  }

  @override
  Future<Null> set(String key, List<int> value) async {
    return await prefs.setString(key, utf8.decode(value));
  }
}
