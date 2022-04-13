import 'package:flextensions/extensions/date_time.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  test('isOnOrBefore returns correct values', () async {
    final now = DateTime(2022, 2, 21);
    expect(now.isOnOrBefore(now), true);
    expect(now.isOnOrBefore(DateTime(2022, 2, 22)), true);
    expect(now.isOnOrBefore(DateTime(2022, 2, 20)), false);
    expect(now.isOnOrBefore(DateTime(2022, 2, 20, 23, 59, 59)), false);
    expect(now.isOnOrBefore(DateTime(2022, 2, 21, 00, 00, 01)), true);
  });

  test('isOnOrAfter returns correct values', () async {
    final now = DateTime(2022, 2, 21);
    expect(now.isOnOrAfter(now), true);
    expect(now.isOnOrAfter(DateTime(2022, 2, 22)), false);
    expect(now.isOnOrAfter(DateTime(2022, 2, 20)), true);
    expect(now.isOnOrAfter(DateTime(2022, 2, 20, 23, 59, 59)), true);
    expect(now.isOnOrAfter(DateTime(2022, 2, 21, 00, 00, 01)), false);
  });

  test('isSameWeek returns correct values', () async {
    final now = DateTime(2022, 2, 16);
    expect(now.isSameWeek(now), true);
    expect(now.isSameWeek(now.startOfWeek), true);
    expect(now.isSameWeek(now.endOfWeek), true);
    expect(DateTime(2022, 1, 17).isSameWeek(now), false);
    expect(DateTime(2022, 2, 13).isSameWeek(now), false);
    expect(DateTime(2022, 2, 14).isSameWeek(now), true);
    expect(DateTime(2022, 2, 15).isSameWeek(now), true);
    expect(DateTime(2022, 2, 16).isSameWeek(now), true);
    expect(DateTime(2022, 2, 17).isSameWeek(now), true);
    expect(DateTime(2022, 2, 18).isSameWeek(now), true);
    expect(DateTime(2022, 2, 19).isSameWeek(now), true);
    expect(DateTime(2022, 2, 20).isSameWeek(now), true);
    expect(DateTime(2022, 2, 21).isSameWeek(now), false);
    expect(DateTime(2022, 2, 28).isSameWeek(now), false);
    expect(DateTime(2022, 3, 16).isSameWeek(now), false);
  });

  test('previousMonday returns correct values', () async {
    expect(DateTime(2022, 1, 12).previousMonday, DateTime(2022, 1, 10));
    expect(DateTime(2022, 1, 10).previousMonday, DateTime(2022, 1, 3));
    expect(DateTime(2022, 1, 17).previousMonday, DateTime(2022, 1, 10));
    expect(DateTime(2022, 1, 18).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 19).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 20).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 21).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 22).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 1, 23).previousMonday, DateTime(2022, 1, 17));
    expect(DateTime(2022, 3, 28).previousMonday, DateTime(2022, 3, 21));
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

  group('copyWith - ', () {
    test('uses all given values', () async {
      expect(
        DateTime(2012, 12, 12, 12, 12, 12, 120, 120).copyWith(
          year: 2014,
          month: 14,
          day: 14,
          hour: 14,
          minute: 14,
          second: 14,
          millisecond: 140,
          microsecond: 140,
        ),
        DateTime(2014, 14, 14, 14, 14, 14, 140, 140),
      );
    });

    test('changes nothing if no values given', () {
      expect(
        DateTime(2012, 12, 12, 12, 12, 12, 120, 120).copyWith(),
        DateTime(2012, 12, 12, 12, 12, 12, 120, 120),
      );
    });

    test('changes only given values', () {
      expect(
        DateTime(2012, 12, 12, 12, 12, 12, 120, 120).copyWith(
          year: 2013,
          day: 13,
          minute: 13,
          millisecond: 13,
        ),
        DateTime(2013, 12, 13, 12, 13, 12, 13, 120),
      );
    });
  });
}
