import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MockSecure implements FlutterSecureStorage {
  final map = Map<String, String>();

  @override
  Future<void> delete({String key}) async {
    return map.remove(key);
  }

  @override
  Future<void> deleteAll() async {
    return map.clear();
  }

  @override
  Future<String> read({String key}) async {
    return map[key];
  }

  @override
  Future<Map<String, String>> readAll() async {
    return map;
  }

  @override
  Future<void> write({String key, String value}) async {
    return map[key] = value;
  }
}
