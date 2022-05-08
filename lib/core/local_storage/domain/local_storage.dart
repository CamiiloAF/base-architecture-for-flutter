/// Handle Local storage IO operations
abstract class LocalStorage {
  Future<String?> fetch(final String key);

  Future<void> delete(final String key);

  Future<void> save({required final String key, required final String value});

  Future<void> clean();
}
