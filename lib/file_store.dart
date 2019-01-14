import 'dart:io';

import 'package:storage/store.dart';

class FileStore extends Store {
  String _basePath;

  FileStore(this._basePath);

  @override
  bool exists(String key) {
    return _file(key: key).existsSync();
  }

  @override
  Future<List<int>> get(String key) async {
    try {
      return await _file(key: key).readAsBytes();
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Null> set(String key, List<int> data) async {
    await _file(key: key).writeAsBytes(data);
  }

  File _file({String key}) {
    final fileName = key.replaceAll("/", "_");
    return File("$_basePath/$fileName");
  }
}
