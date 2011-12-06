// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// WARNING: Do not edit - generated code.

class _DOMSelectionWrappingImplementation extends DOMWrapperBase implements DOMSelection {
  _DOMSelectionWrappingImplementation() : super() {}

  static create__DOMSelectionWrappingImplementation() native {
    return new _DOMSelectionWrappingImplementation();
  }

  Node get anchorNode() { return _get_anchorNode(this); }
  static Node _get_anchorNode(var _this) native;

  int get anchorOffset() { return _get_anchorOffset(this); }
  static int _get_anchorOffset(var _this) native;

  Node get baseNode() { return _get_baseNode(this); }
  static Node _get_baseNode(var _this) native;

  int get baseOffset() { return _get_baseOffset(this); }
  static int _get_baseOffset(var _this) native;

  Node get extentNode() { return _get_extentNode(this); }
  static Node _get_extentNode(var _this) native;

  int get extentOffset() { return _get_extentOffset(this); }
  static int _get_extentOffset(var _this) native;

  Node get focusNode() { return _get_focusNode(this); }
  static Node _get_focusNode(var _this) native;

  int get focusOffset() { return _get_focusOffset(this); }
  static int _get_focusOffset(var _this) native;

  bool get isCollapsed() { return _get_isCollapsed(this); }
  static bool _get_isCollapsed(var _this) native;

  int get rangeCount() { return _get_rangeCount(this); }
  static int _get_rangeCount(var _this) native;

  String get type() { return _get_type(this); }
  static String _get_type(var _this) native;

  void addRange(Range range) {
    _addRange(this, range);
    return;
  }
  static void _addRange(receiver, range) native;

  void collapse(Node node, int index) {
    _collapse(this, node, index);
    return;
  }
  static void _collapse(receiver, node, index) native;

  void collapseToEnd() {
    _collapseToEnd(this);
    return;
  }
  static void _collapseToEnd(receiver) native;

  void collapseToStart() {
    _collapseToStart(this);
    return;
  }
  static void _collapseToStart(receiver) native;

  bool containsNode(Node node, bool allowPartial) {
    return _containsNode(this, node, allowPartial);
  }
  static bool _containsNode(receiver, node, allowPartial) native;

  void deleteFromDocument() {
    _deleteFromDocument(this);
    return;
  }
  static void _deleteFromDocument(receiver) native;

  void empty() {
    _empty(this);
    return;
  }
  static void _empty(receiver) native;

  void extend(Node node, int offset) {
    _extend(this, node, offset);
    return;
  }
  static void _extend(receiver, node, offset) native;

  Range getRangeAt(int index) {
    return _getRangeAt(this, index);
  }
  static Range _getRangeAt(receiver, index) native;

  void modify(String alter, String direction, String granularity) {
    _modify(this, alter, direction, granularity);
    return;
  }
  static void _modify(receiver, alter, direction, granularity) native;

  void removeAllRanges() {
    _removeAllRanges(this);
    return;
  }
  static void _removeAllRanges(receiver) native;

  void selectAllChildren(Node node) {
    _selectAllChildren(this, node);
    return;
  }
  static void _selectAllChildren(receiver, node) native;

  void setBaseAndExtent(Node baseNode, int baseOffset, Node extentNode, int extentOffset) {
    _setBaseAndExtent(this, baseNode, baseOffset, extentNode, extentOffset);
    return;
  }
  static void _setBaseAndExtent(receiver, baseNode, baseOffset, extentNode, extentOffset) native;

  void setPosition(Node node, int offset) {
    _setPosition(this, node, offset);
    return;
  }
  static void _setPosition(receiver, node, offset) native;

  String toString() {
    return _toString(this);
  }
  static String _toString(receiver) native;

  String get typeName() { return "DOMSelection"; }
}
