extension NullableIterableExts<T> on Iterable<T>? {
  Iterable<T> orEmpty() {
    return this ?? [];
  }
}
