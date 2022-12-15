import 'package:flextensions/extensions/primitive_exts.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoolExts -', () {
    test('toInt() - returns correct values', () {
      expect(true.toInt(), 1);
      expect(false.toInt(), 0);
    });
  });
}
