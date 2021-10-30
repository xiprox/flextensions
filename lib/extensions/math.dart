extension on num {
  num p(num other) => this + other;
  num m(num other) => this - other;
  num t(num other) => this * other;
  num d(num other) => this / other;
}

extension IntArithmeticExts on int {
  int plus(num other) => p(other) as int;
  int minus(num other) => m(other) as int;
  int times(num other) => t(other) as int;
  int dividedBy(num other) => d(other) as int;
}

extension DoubleArithmeticExts on double {
  double plus(num other) => p(other) as double;
  double minus(num other) => m(other) as double;
  double times(num other) => t(other) as double;
  double dividedBy(num other) => d(other) as double;
}
