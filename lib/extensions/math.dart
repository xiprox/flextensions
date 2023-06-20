extension on num {
  num p(num other) => this + other;
  num m(num other) => this - other;
  num t(num other) => this * other;
  num d(num other) => this / other;
}

extension IntArithmeticExts on int {
  int plus(num other) => p(other).toInt();
  int minus(num other) => m(other).toInt();
  int times(num other) => t(other).toInt();
  int dividedBy(num other) => d(other).toInt();
}

extension DoubleArithmeticExts on double {
  double plus(num other) => p(other).toDouble();
  double minus(num other) => m(other).toDouble();
  double times(num other) => t(other).toDouble();
  double dividedBy(num other) => d(other).toDouble();
}
