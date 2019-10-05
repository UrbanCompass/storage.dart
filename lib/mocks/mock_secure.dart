import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MockSecure implements FlutterSecureStorage {
  final map = Map<String, String>();

  @override
  Future<void> delete(
      {String key, iOSOptions iOptions, AndroidOptions aOptions}) async {
    return map.remove(key);
  }

  @override
  Future<void> deleteAll({iOSOptions iOptions, AndroidOptions aOptions}) async {
    return map.clear();
  }

  @override
  Future<String> read(
      {String key, iOSOptions iOptions, AndroidOptions aOptions}) async {
    return map[key];
  }

  @override
  Future<Map<String, String>> readAll(
      {iOSOptions iOptions, AndroidOptions aOptions}) async {
    return map;
  }

  @override
  Future<void> write(
      {String key,
      String value,
      iOSOptions iOptions,
      AndroidOptions aOptions}) async {
    return map[key] = value;
  }
}
