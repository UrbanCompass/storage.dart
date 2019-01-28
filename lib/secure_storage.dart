import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:storage/storage_container.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StorageContainer {
  final FlutterSecureStorage storage;

  SecureStorage({@required this.storage});

  @override
  Future<bool> getBool(String key) async {
    final string = await getString(key);
    return string != null ? json.decode(string) : null;
  }

  @override
  Future<List<int>> getData(String key) async {
    final string = await getString(key);
    if (string == null) {
      return null;
    }
    final data = json.decode(string).map<int>((value) => value as int);
    return data.toList();
  }

  @override
  Future<double> getDouble(String key) async {
    final string = await getString(key);
    return string != null ? json.decode(string) : null;
  }

  @override
  Future<int> getInt(String key) async {
    final string = await getString(key);
    return string != null ? json.decode(string) : null;
  }

  @override
  Future<Map<String, dynamic>> getMap(String key) async {
    final string = await getString(key);
    return string != null ? json.decode(string) : null;
  }

  @override
  Future<String> getString(String key) async {
    return await storage.read(key: key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await setString(key, json.encode(value));
  }

  @override
  Future<bool> setData(String key, List<int> value) async {
    return await setString(key, json.encode(value));
  }

  @override
  Future<bool> setDouble(String key, double value) async {
    return await setString(key, json.encode(value));
  }

  @override
  Future<bool> setInt(String key, int value) async {
    return await setString(key, json.encode(value));
  }

  @override
  Future<bool> setMap(String key, Map<String, dynamic> value) async {
    return await setString(key, json.encode(value));
  }

  @override
  Future<bool> setString(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  @override
  Future<bool> exists(String key) async {
    final value = await storage.read(key: key);
    return value != null;
  }
}
