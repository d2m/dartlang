// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

class Expect {

  /**
   * Checks whether the expected and actual values are equal (using [:==:]).
   */
  static void equals(var expected, var actual, [String reason = null]) {
    if (expected == actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.equals(expected: <$expected>, actual: <$actual>$msg) fails.");
  }

  /**
   * Checks whether the actual value is a bool and its value is true.
   */
  static void isTrue(var actual, [String reason = null]) {
    if (actual === true) return;
    String msg = _getMessage(reason);
    _fail("Expect.isTrue($actual$msg) fails.");
  }

  /**
   * Checks whether the actual value is a bool and its value is false.
   */
  static void isFalse(var actual, [String reason = null]) {
    if (actual === false) return;
    String msg = _getMessage(reason);
    _fail("Expect.isFalse($actual$msg) fails.");
  }

  /**
   * Checks whether [actual] is null.
   */
  static void isNull(actual, [String reason = null]) {
    if (null === actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.isNull(actual: <$actual>$msg) fails.");
  }

  /**
   * Checks whether [actual] is not null.
   */
  static void isNotNull(actual, [String reason = null]) {
    if (null !== actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.isNotNull(actual: <$actual>$msg) fails.");
  }

  /**
   * Checks whether the expected and actual values are identical
   * (using [:===:]).
   */
  static void identical(var expected, var actual, [String reason = null]) {
    if (expected === actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.identical(expected: <$expected>, actual: <$actual>$msg) " +
          "fails.");
  }

  // Unconditional failure.
  static void fail(String msg) {
    _fail("Expect.fail('$msg')");
  }

  /**
   * Failure if the difference between expected and actual is greater than the
   * given tolerance. If no tolerance is given, tolerance is assumed to be the
   * value 4 significant digits smaller than the value given for expected.
   */
  static void approxEquals(num expected,
                           num actual,
                           [num tolerance = null,
                            String reason = null]) {
    if (tolerance === null) {
      tolerance = (expected / Math.pow(10.0, 4.0)).abs();
    }
    // Note: use !( <= ) rather than > so we fail on NaNs
    if ((expected - actual).abs() <= tolerance) return;

    String msg = _getMessage(reason);
    _fail('Expect.approxEquals(expected:<$expected>, actual:<$actual>, ' +
          'tolerance:<$tolerance>$msg) fails');
  }

  static void notEquals(unexpected, actual, [String reason = null]) {
    if (unexpected != actual) return;
    String msg = _getMessage(reason);
    _fail("Expect.notEquals(unexpected: <$unexpected>, actual:<$actual>$msg) " +
          "fails.");
  }

  /**
   * Checks that all elements in [expected] and [actual] are equal [:==:].
   * This is different than the typical check for identity equality [:===:]
   * used by the standard list implementation.  It should also produce nicer
   * error messages than just calling [:Expect.equals(expected, actual):].
   */
  static void listEquals(List expected, List actual, [String reason = null]) {
    String msg = _getMessage(reason);
    int n = Math.min(expected.length, actual.length);
    for (int i = 0; i < n; i++) {
      if (expected[i] != actual[i]) {
        _fail('Expect.listEquals(at index $i, ' +
              'expected: <${expected[i]}>, actual: <${actual[i]}>$msg) fails');
      }
    }
    // We check on length at the end in order to provide better error
    // messages when an unexpected item is inserted in a list.
    if (expected.length != actual.length) {
      _fail('Expect.listEquals(list length, ' +
        'expected: <${expected.length}>, actual: <${actual.length}>$msg) ' +
        'fails');
    }
  }


  /**
   * Specialized equality test for strings. When the strings don't match,
   * this method shows where the mismatch starts and ends.
   */
  static void stringEquals(String expected,
                           String actual,
                           [String reason = null]) {
    String msg = _getMessage(reason);
    String defaultMessage =
        'Expect.stringEquals(expected: <$expected>", <$actual>$msg) fails';

    if (expected == actual) return;
    if ((expected === null) || (actual === null)) {
      _fail('$defaultMessage');
    }
    // scan from the left until we find a mismatch
    int left = 0;
    int eLen = expected.length;
    int aLen = actual.length;
    while (true) {
      if (left == eLen) {
        assert (left < aLen);
        String snippet = actual.substring(left, aLen);
        _fail('$defaultMessage\nDiff:\n...[  ]\n...[ $snippet ]');
        return;
      }
      if (left == aLen) {
        assert (left < eLen);
        String snippet = expected.substring(left, eLen);
        _fail('$defaultMessage\nDiff:\n...[  ]\n...[ $snippet ]');
        return;
      }
      if (expected[left] != actual[left]) {
        break;
      }
      left++;
    }

    // scan from the right until we find a mismatch
    int right = 0;
    while (true) {
      if (right == eLen) {
        assert (right < aLen);
        String snippet = actual.substring(0, aLen - right);
        _fail('$defaultMessage\nDiff:\n[  ]...\n[ $snippet ]...');
        return;
      }
      if (right == aLen) {
        assert (right < eLen);
        String snippet = expected.substring(0, eLen - right);
        _fail('$defaultMessage\nDiff:\n[  ]...\n[ $snippet ]...');
        return;
      }
      if (expected[eLen - right - 1] != actual[aLen - right - 1]) {
        break;
      }
      right++;
    }
    String eSnippet = expected.substring(left, eLen - right);
    String aSnippet = actual.substring(left, aLen - right);
    String diff = '\nDiff:\n...[ $eSnippet} ]...\n...[ $aSnippet ]...';
    _fail('$defaultMessage$diff');
  }

  /**
   * Checks that every element of [expected] is also in [actual], and that
   * every element of [actual] is also in [expected].
   */
  static void setEquals(Iterable expected,
                        Iterable actual,
                        [String reason = null]) {
    final missingSet = new Set.from(expected);
    missingSet.removeAll(actual);
    final extraSet = new Set.from(actual);
    extraSet.removeAll(expected);

    if (extraSet.isEmpty() && missingSet.isEmpty()) return;
    String msg = _getMessage(reason);

    StringBuffer sb = new StringBuffer("Expect.setEquals($msg) fails");
    // Report any missing items.
    if (!missingSet.isEmpty()) {
      sb.add('\nExpected collection does not contain: ');
    }

    for (final val in missingSet) {
      sb.add('$val ');
    }

    // Report any extra items.
    if (!extraSet.isEmpty()) {
      sb.add('\nExpected collection should not contain: ');
    }

    for (final val in extraSet) {
      sb.add('$val ');
    }
    _fail(sb.toString());
  }

  /**
   * Calls the function [f] and verifies that it throws an exception.
   * The optional [check] function can provide additional validation
   * that the correct exception is being thrown.  For example, to check
   * the type of the exception you could write this:
   *
   * [:
   *   Expect.throws(myThrowingFunction,
   *                 (e) { return e is MyException})
   * :]
   */
  static void throws(void f(),
                     [_CheckExceptionFn check = null,
                      String reason = null]) {
    try {
      f();
    } catch (var e) {
      if (check !== null) {
        Expect.isTrue(check(e));
      }
      return;
    }
    String msg = _getMessage(reason);
    _fail('Expect.throws($msg) fails');
  }

  static String _getMessage(String reason)
      => (reason === null) ? "" : ", '$reason'";

  static void _fail(String message) {
    throw new ExpectException(message);
  }
}

typedef bool _CheckExceptionFn(exception);

class ExpectException implements Exception {
  ExpectException(this.message);
  String toString() => message;
  String message;
}
