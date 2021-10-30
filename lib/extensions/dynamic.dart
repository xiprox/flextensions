extension DynamicExts<T> on T {
  OtherType as<OtherType>() => this as OtherType;

  void use(Function(T) doStuff) {
    if (this != null) doStuff(this);
  }
}

extension NullableDynamicExts<T> on T? {
  T or(T value) => this ?? value;
}
