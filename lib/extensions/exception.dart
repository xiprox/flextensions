extension ExceptionExts on Exception {
  /// Returns the exception message without the "Exception: " part.
  String cleanMessage() {
    return toString().replaceAll(RegExp(r'\w*Exception\b[:]?[\s]+'), '');
  }
}
