// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// Exceptions are thrown either by the VM or from Dart code.

/**
 * Interface implemented by all core library exceptions.
 */
interface Exception factory ExceptionImplementation {
  const Exception([var msg]);
}


/**
 * Exception thrown because of an index outside of the valid range.
 */
class IndexOutOfRangeException implements Exception {
  const IndexOutOfRangeException(int this._index);
  String toString() => "IndexOutOfRangeException: $_index";
  final int _index;
}


/**
 * Exception thrown because of attempt to modify an immutable object.
 */
class IllegalAccessException implements Exception {
  const IllegalAccessException();
  String toString() => "Attempt to modify an immutable object";
}


/**
 * Exception thrown because of non-existing receiver's method.
 */
class NoSuchMethodException implements Exception {
  const NoSuchMethodException(Object this._receiver,
                              String this._functionName,
                              List this._arguments);

  String toString() {
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < _arguments.length; i++) {
      if (i > 0) {
        sb.add(", ");
      }
      sb.add(_arguments[i]);
    }
    sb.add("]");
    return "NoSuchMethodException - receiver: '$_receiver' " +
           "function name: '$_functionName' arguments: [$sb]";
  }

  final Object _receiver;
  final String _functionName;
  final List _arguments;
}


class ClosureArgumentMismatchException implements Exception {
  const ClosureArgumentMismatchException();
  String toString() => "Closure argument mismatch";
}


class ObjectNotClosureException implements Exception {
  const ObjectNotClosureException();
  String toString() => "Object is not closure";
}


class IllegalArgumentException implements Exception {
  const IllegalArgumentException([args = ""]) : _args = args;
  String toString() => "Illegal argument(s): $_args";
  final String _args;
}


class OutOfMemoryException implements Exception {
  const OutOfMemoryException();
  String toString() => "Out of Memory";
}


class StackOverflowException implements Exception {
  const StackOverflowException();
  String toString() => "Stack Overflow";
}


class BadNumberFormatException implements Exception {
  const BadNumberFormatException(String this._s);
  String toString() => "BadNumberFormatException: '$_s'";
  final String _s;
}


class WrongArgumentCountException implements Exception {
  const WrongArgumentCountException();
  String toString() => "WrongArgumentCountException";
}


class NullPointerException implements Exception {
  const NullPointerException();
  String toString() => "NullPointerException";
}


class NoMoreElementsException implements Exception {
  const NoMoreElementsException();
  String toString() => "NoMoreElementsException";
}


class EmptyQueueException implements Exception {
  const EmptyQueueException();
  String toString() => "EmptyQueueException";
}


class UnsupportedOperationException implements Exception {
  const UnsupportedOperationException(String this._message);
  String toString() => "UnsupportedOperationException: $_message";
  final String _message;
}


class NotImplementedException implements Exception {
  const NotImplementedException();
  String toString() => "NotImplementedException";
}


class IllegalJSRegExpException implements Exception {
  const IllegalJSRegExpException(String this._pattern, String this._errmsg);
  String toString() => "IllegalJSRegExpException: '$_pattern' '$_errmsg'";
  final String _pattern;
  final String _errmsg;
}


class IntegerDivisionByZeroException implements Exception {
  const IntegerDivisionByZeroException();
  String toString() => "IntegerDivisionByZeroException";
}
