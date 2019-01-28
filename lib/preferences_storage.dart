//  Copyright © 2019 Compass. All rights reserved.

import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storage/storage_container.dart';

class PreferencesStorage extends StorageContainer {
  final SharedPreferences prefs;

  PreferencesStorage({@required this.prefs});

  @override
  Future<bool> getBool(String key) async {
    return prefs.getBool(key);
  }

  @override
  Future<List<int>> getData(String key) async {
    final value = await prefs.get(key);
    return (value == null) ? null : utf8.encode(value);
  }

  @override
  Future<double> getDouble(String key) async {
    return prefs.getDouble(key);
  }

  @override
  Future<int> getInt(String key) async {
    return prefs.getInt(key);
  }

  @override
  Future<Map<String, dynamic>> getMap(String key) async {
    final string = await getString(key);
    return json.decode(string);
  }

  @override
  Future<String> getString(String key) async {
    return prefs.getString(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return prefs.setBool(key, value);
  }

  @override
  Future<bool> setData(String key, List<int> value) async {
    return await prefs.setString(key, utf8.decode(value));
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return prefs.setDouble(key, value);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return prefs.setInt(key, value);
  }

  @override
  Future<bool> setMap(String key, Map<String, dynamic> value) async {
    final string = json.encode(value);
    return prefs.setString(key, string);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return prefs.setString(key, value);
  }

  @override
  Future<bool> exists(String key) async {
    return prefs.getKeys().contains(key);
  }
}
