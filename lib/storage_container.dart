//  Copyright © 2019 Compass. All rights reserved.

import 'dart:async';

abstract class StorageContainer {
  Future<bool> getBool(String key);
  Future<bool> setBool(String key, bool value);

  Future<String> getString(String key);
  Future<bool> setString(String key, String value);

  Future<int> getInt(String key);
  Future<bool> setInt(String key, int value);

  Future<double> getDouble(String key);
  Future<bool> setDouble(String key, double value);

  Future<Map<String, dynamic>> getMap(String key);
  Future<bool> setMap(String key, Map<String, dynamic> value);

  Future<List<int>> getData(String key);
  Future<bool> setData(String key, List<int> value);

  Future<bool> exists(String key);
}
