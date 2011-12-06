// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// WARNING: Do not edit - generated code.

class _StorageInfoUsageCallbackWrappingImplementation extends DOMWrapperBase implements StorageInfoUsageCallback {
  _StorageInfoUsageCallbackWrappingImplementation() : super() {}

  static create__StorageInfoUsageCallbackWrappingImplementation() native {
    return new _StorageInfoUsageCallbackWrappingImplementation();
  }

  bool handleEvent(int currentUsageInBytes, int currentQuotaInBytes) {
    return _handleEvent(this, currentUsageInBytes, currentQuotaInBytes);
  }
  static bool _handleEvent(receiver, currentUsageInBytes, currentQuotaInBytes) native;

  String get typeName() { return "StorageInfoUsageCallback"; }
}
