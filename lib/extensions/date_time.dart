import 'package:intl/intl.dart';

extension DateTimeExts on DateTime {
  DateTime get previousDay => subtract(const Duration(days: 1));
  DateTime get nextDay => add(const Duration(days: 1));
  DateTime get nextYear => add(const Duration(days: 365));

  DateTime get previousMonday {
    if (isMonday()) return add(const Duration(days: -7));
    return add(-Duration(days: weekday - 1));
  }

  DateTime get nextMonday => add(Duration(days: 7 - weekday + 1));

  bool isToday() => isSameDay(DateTime.now());

  bool isTomorrow() => isSameDay(DateTime.now().nextDay);

  bool isYesterday() => isSameDay(DateTime.now().previousDay);

  bool isThisYear() => year == DateTime.now().year;

  bool isBeforeNow() {
    return isBefore(DateTime.now());
  }

  bool isBeforeToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return isBefore(today);
  }

  bool isSameDay(DateTime other) {
    return isSameMonth(other) && day == other.day;
  }

  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  bool isFuture() => isAfter(DateTime.now());
  bool isPast() => isBefore(DateTime.now());

  /// Returns [DateTime] of the first day in the month this
  /// [DateTime] is in, without hour, minute, second, etc. info.
  DateTime get firstDateInThisMonth => DateTime(year, month, 1);

  /// Returns [DateTime] of the last day in the month this
  /// [DateTime] is in, without hour, minute, second, etc. info.
  DateTime get lastDateInThisMonth {
    return beginningOfNextMonth.subtract(const Duration(days: 1));
  }

  /// Returns [DateTime] of the last moment in the month this
  /// [DateTime] is in.
  ///
  /// This is the very end of the month.
  DateTime get lastMomentInThisMonth {
    return beginningOfNextMonth.subtract(const Duration(microseconds: 1));
  }

  int get numberOfDaysThisMonth {
    return beginningOfNextMonth.difference(beginningOfThisMonth).inDays;
  }

  /// Beginning of the day.
  DateTime get beginning => DateTime(year, month, day);

  /// End of the day.
  DateTime get end =>
      DateTime(year, month, day + 1).subtract(const Duration(microseconds: 1));

  /// Returns the Monday of this week.
  DateTime get startOfWeek => DateTime(year, month, day - weekday + 1);

  /// Returns the Sunday of this week.
  DateTime get endOfWeek => DateTime(year, month, day + 7 - weekday);

  DateTime get beginningOfThisMonth => DateTime(year, month, 1);

  DateTime get beginningOfNextMonth {
    return (month < DateTime.december)
        ? DateTime(year, month + 1, 1)
        : DateTime(year + 1, 1, 1);
  }

  /// Returns the number of extra days at the beginning of a calendar
  /// table when the start of this month is something other than Monday.
  int get extraDaysStart {
    // date.weekday returns an int in the range of 1..7, Monday to Sunday,
    // respectively. Subtract 1 for this day itself and you know the number
    // of extras.
    return firstDateInThisMonth.weekday - 1;
  }

  /// Returns the number of extra days at the end of a calendar table
  /// when the end of currently visible month is something other than Sunday.
  int get extraDaysEnd {
    // date.weekday returns an int in the range of 1..7, Monday to Sunday,
    // respectively. Subtract this day from the week and you know the number
    // of extras.
    return 7 - lastDateInThisMonth.weekday;
  }

  /// Returns this DateTime without hour, minute, second, etc. information.
  DateTime startOfDay() => DateTime(year, month, day);

  bool isMonday() => weekday == DateTime.monday;
  bool isTuesday() => weekday == DateTime.tuesday;
  bool isWednesday() => weekday == DateTime.wednesday;
  bool isThursday() => weekday == DateTime.thursday;
  bool isFriday() => weekday == DateTime.friday;
  bool isSaturday() => weekday == DateTime.saturday;
  bool isSunday() => weekday == DateTime.sunday;
  bool isWeekend() => isSaturday() || isSunday();

  String format(DateFormat formatter) => formatter.format(this);
}
