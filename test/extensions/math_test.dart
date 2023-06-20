import 'package:flextensions/extensions/math.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntArithmeticExts', () {
    test('plus', () {
      expect(1.plus(2), equals(3));
    });

    test('minus', () {
      expect(3.minus(2), equals(1));
    });

    test('times', () {
      expect(2.times(3), equals(6));
    });

    test('dividedBy', () {
      expect(6.dividedBy(3), equals(2));
    });
  });

  group('DoubleArithmeticExts', () {
    test('plus', () {
      expect(1.0.plus(2), equals(3.0));
    });

    test('minus', () {
      expect(3.0.minus(2), equals(1.0));
    });

    test('times', () {
      expect(2.0.times(3), equals(6.0));
    });

    test('dividedBy', () {
      expect(6.0.dividedBy(3), equals(2.0));
    });
  });
}
