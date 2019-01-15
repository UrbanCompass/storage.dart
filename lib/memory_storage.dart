//  Copyright © 2019 Compass. All rights reserved.

import 'package:storage/storage_container.dart';

class MemoryStorage extends StorageContainer {
  final map = Map<String, List<int>>();

  @override
  bool exists(String key) {
    return map[key] != null;
  }

  @override
  Future<List<int>> get(String key) async {
    return map[key];
  }

  @override
  Future<Null> set(String key, List<int> data) async {
    map[key] = data;
  }
}
