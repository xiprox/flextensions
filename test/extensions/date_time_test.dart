import 'package:flextensions/extensions/date_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('previousMonday returns correct values', () async {
    expect(DateTime(2022, 1, 12).previousMonday, DateTime(2022, 1, 10));
    expect(DateTime(2022, 1, 10).previousMonday, DateTime(2022, 1, 3));
    expect(DateTime(2022, 1, 17).previousMonday, DateTime(2022, 1, 10));
    expect(DateTime(2022, 1, 18).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 23).previousMonday, DateTime(2022, 1, 17));
  });

  test('nextMonday returns correct values', () async {
    expect(DateTime(2022, 1, 12).nextMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 10).nextMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 17).nextMonday, DateTime(2022, 1, 24));
    expect(DateTime(2022, 1, 18).nextMonday, DateTime(2022, 1, 24));
    expect(DateTime(2022, 1, 23).nextMonday, DateTime(2022, 1, 24));
  });
}
