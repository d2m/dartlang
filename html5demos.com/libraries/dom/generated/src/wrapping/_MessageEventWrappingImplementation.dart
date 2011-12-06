// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// WARNING: Do not edit - generated code.

class _MessageEventWrappingImplementation extends _EventWrappingImplementation implements MessageEvent {
  _MessageEventWrappingImplementation() : super() {}

  static create__MessageEventWrappingImplementation() native {
    return new _MessageEventWrappingImplementation();
  }

  Object get data() { return _get_data(this); }
  static Object _get_data(var _this) native;

  String get lastEventId() { return _get_lastEventId(this); }
  static String _get_lastEventId(var _this) native;

  String get origin() { return _get_origin(this); }
  static String _get_origin(var _this) native;

  List get ports() { return _get_ports(this); }
  static List _get_ports(var _this) native;

  DOMWindow get source() { return _get_source(this); }
  static DOMWindow _get_source(var _this) native;

  void initMessageEvent(String typeArg, bool canBubbleArg, bool cancelableArg, Object dataArg, String originArg, String lastEventIdArg, DOMWindow sourceArg, List messagePorts) {
    _initMessageEvent(this, typeArg, canBubbleArg, cancelableArg, dataArg, originArg, lastEventIdArg, sourceArg, messagePorts);
    return;
  }
  static void _initMessageEvent(receiver, typeArg, canBubbleArg, cancelableArg, dataArg, originArg, lastEventIdArg, sourceArg, messagePorts) native;

  void webkitInitMessageEvent(String typeArg, bool canBubbleArg, bool cancelableArg, Object dataArg, String originArg, String lastEventIdArg, DOMWindow sourceArg, List transferables) {
    _webkitInitMessageEvent(this, typeArg, canBubbleArg, cancelableArg, dataArg, originArg, lastEventIdArg, sourceArg, transferables);
    return;
  }
  static void _webkitInitMessageEvent(receiver, typeArg, canBubbleArg, cancelableArg, dataArg, originArg, lastEventIdArg, sourceArg, transferables) native;

  String get typeName() { return "MessageEvent"; }
}
