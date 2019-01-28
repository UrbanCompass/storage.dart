//  Copyright © 2019 Compass. All rights reserved.

import 'package:storage/storage_container.dart';

class MemoryStorage extends StorageContainer {
  final map = Map<String, dynamic>();

  @override
  Future<bool> getBool(String key) async {
    return map[key];
  }

  @override
  Future<List<int>> getData(String key) async {
    return map[key];
  }

  @override
  Future<double> getDouble(String key) async {
    return map[key];
  }

  @override
  Future<int> getInt(String key) async {
    return map[key];
  }

  @override
  Future<Map<String, dynamic>> getMap(String key) async {
    return map[key];
  }

  @override
  Future<String> getString(String key) async {
    return map[key];
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    map[key] = value;
    return true;
  }

  @override
  Future<bool> setData(String key, List<int> value) async {
    map[key] = value;
    return true;
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    map[key] = value;
    return true;
  }

  @override
  Future<bool> setInt(String key, int value) async {
    map[key] = value;
    return true;
  }

  @override
  Future<bool> setMap(String key, Map<String, dynamic> value) async {
    map[key] = value;
    return true;
  }

  @override
  Future<bool> setString(String key, String value) async {
    map[key] = value;
    return true;
  }

  @override
  Future<bool> exists(String key) async {
    return map[key] != null;
  }
}
