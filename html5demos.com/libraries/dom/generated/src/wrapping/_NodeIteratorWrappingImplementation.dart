// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// WARNING: Do not edit - generated code.

class _NodeIteratorWrappingImplementation extends DOMWrapperBase implements NodeIterator {
  _NodeIteratorWrappingImplementation() : super() {}

  static create__NodeIteratorWrappingImplementation() native {
    return new _NodeIteratorWrappingImplementation();
  }

  bool get expandEntityReferences() { return _get_expandEntityReferences(this); }
  static bool _get_expandEntityReferences(var _this) native;

  NodeFilter get filter() { return _get_filter(this); }
  static NodeFilter _get_filter(var _this) native;

  bool get pointerBeforeReferenceNode() { return _get_pointerBeforeReferenceNode(this); }
  static bool _get_pointerBeforeReferenceNode(var _this) native;

  Node get referenceNode() { return _get_referenceNode(this); }
  static Node _get_referenceNode(var _this) native;

  Node get root() { return _get_root(this); }
  static Node _get_root(var _this) native;

  int get whatToShow() { return _get_whatToShow(this); }
  static int _get_whatToShow(var _this) native;

  void detach() {
    _detach(this);
    return;
  }
  static void _detach(receiver) native;

  Node nextNode() {
    return _nextNode(this);
  }
  static Node _nextNode(receiver) native;

  Node previousNode() {
    return _previousNode(this);
  }
  static Node _previousNode(receiver) native;

  String get typeName() { return "NodeIterator"; }
}
