abstract class Store {
  Future<List<int>> get(String key);
  Future<Null> set(String key, List<int> value);
  bool exists(String key);
}
