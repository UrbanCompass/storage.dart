//  Copyright © 2019 Compass. All rights reserved.

abstract class StorageContainer {
  Future<List<int>> get(String key);
  Future<Null> set(String key, List<int> value);
  bool exists(String key);
}
