// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Dart core library.

/**
 * A [Duration] represents a time span. A duration can be negative.
 */
interface Duration extends Comparable factory DurationImplementation {
  /**
   * The duration is the sum of all individual parts. This means that individual
   * parts don't need to be less than the next-bigger unit. For example [hours]
   * is allowed to have a value greater than 23.
   *
   * All individual parts are allowed to be negative.
   * All arguments are by default 0.
   */
  const Duration([int days, int hours, int minutes, int seconds,
                  int milliseconds]);

 /**
   * Returns this [Duration] in days. Incomplete days are discarded.
   */
  final int inDays;

  /**
   * Returns this [Duration] in days. Incomplete hours are discarded.
   * The returned value can be greater than 23.
   */
  final int inHours;

  /**
   * Returns this [Duration] in minutes. Incomplete minutes are discarded.
   * The returned value can be greater than 59.
   */
  final int inMinutes;

  /**
   * Returns this [Duration] in seconds. Incomplete seconds are discarded.
   * The returned value can be greater than 59.
   */
  final int inSeconds;

  /**
   * Returns this [Duration] in milliseconds.
   */
  final int inMilliseconds;

  static final int MILLISECONDS_PER_SECOND = 1000;
  static final int SECONDS_PER_MINUTE = 60;
  static final int MINUTES_PER_HOUR = 60;
  static final int HOURS_PER_DAY = 24;

  static final int MILLISECONDS_PER_MINUTE =
      MILLISECONDS_PER_SECOND * SECONDS_PER_MINUTE;
  static final int MILLISECONDS_PER_HOUR =
      MILLISECONDS_PER_MINUTE * MINUTES_PER_HOUR;
  static final int MILLISECONDS_PER_DAY =
      MILLISECONDS_PER_HOUR * HOURS_PER_DAY;

  static final int SECONDS_PER_HOUR = SECONDS_PER_MINUTE * MINUTES_PER_HOUR;
  static final int SECONDS_PER_DAY = SECONDS_PER_HOUR * HOURS_PER_DAY;

  static final int MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY;
}
