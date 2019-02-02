//  Copyright © 2019 Compass. All rights reserved.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:storage/storage_container.dart';

class FileStorage extends StorageContainer {
  String _basePath;

  FileStorage(this._basePath);

  @override
  Future<bool> getBool(String key) async {
    final string = await getString(key);
    return string != null ? json.decode(string) : null;
  }

  @override
  Future<List<int>> getData(String key) async {
    try {
      return await _file(key: key).readAsBytes();
    } catch (e) {
      return null;
    }
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
    if (!await exists(key)) {
      return null;
    }
    return _file(key: key).readAsString(encoding: utf8);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return await setString(key, json.encode(value));
  }

  @override
  Future<bool> setData(String key, List<int> value) async {
    return await _file(key: key).writeAsBytes(value) != null;
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
    return await _file(key: key).writeAsString(value, encoding: utf8) != null;
  }

  @override
  Future<bool> exists(String key) async {
    return _file(key: key).exists();
  }

  File _file({String key}) {
    final fileName = key.replaceAll("/", "_");
    return File("$_basePath/$fileName");
  }
}
