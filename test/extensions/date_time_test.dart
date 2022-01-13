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

  test('startOfWeek returns correct values', () async {
    expect(DateTime(2022, 1, 12).startOfWeek, DateTime(2022, 1, 10));
    expect(DateTime(2022, 1, 10).startOfWeek, DateTime(2022, 1, 10));
    expect(DateTime(2022, 1, 17).startOfWeek, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 18).startOfWeek, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 23).startOfWeek, DateTime(2022, 1, 17));
  });

  test('endOfWeek returns correct values', () async {
    expect(DateTime(2022, 1, 12).endOfWeek, DateTime(2022, 1, 16).endOfDay);
    expect(DateTime(2022, 1, 10).endOfWeek, DateTime(2022, 1, 16).endOfDay);
    expect(DateTime(2022, 1, 17).endOfWeek, DateTime(2022, 1, 23).endOfDay);
    expect(DateTime(2022, 1, 18).endOfWeek, DateTime(2022, 1, 23).endOfDay);
    expect(DateTime(2022, 1, 23).endOfWeek, DateTime(2022, 1, 23).endOfDay);
  });

  test('endOfDay returns correct values', () async {
    expect(
      DateTime(2022, 1, 12).endOfDay,
      DateTime(2022, 1, 12, 23, 59, 59, 999, 999),
    );
    expect(
      DateTime(1995, 12, 1).endOfDay,
      DateTime(1995, 12, 1, 23, 59, 59, 999, 999),
    );
    expect(
      DateTime(2021, 10, 7).endOfDay,
      DateTime(2021, 10, 7, 23, 59, 59, 999, 999),
    );
  });
}
