// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// WARNING: Do not edit - generated code.

interface SVGPreserveAspectRatio {

  static final int SVG_MEETORSLICE_MEET = 1;

  static final int SVG_MEETORSLICE_SLICE = 2;

  static final int SVG_MEETORSLICE_UNKNOWN = 0;

  static final int SVG_PRESERVEASPECTRATIO_NONE = 1;

  static final int SVG_PRESERVEASPECTRATIO_UNKNOWN = 0;

  static final int SVG_PRESERVEASPECTRATIO_XMAXYMAX = 10;

  static final int SVG_PRESERVEASPECTRATIO_XMAXYMID = 7;

  static final int SVG_PRESERVEASPECTRATIO_XMAXYMIN = 4;

  static final int SVG_PRESERVEASPECTRATIO_XMIDYMAX = 9;

  static final int SVG_PRESERVEASPECTRATIO_XMIDYMID = 6;

  static final int SVG_PRESERVEASPECTRATIO_XMIDYMIN = 3;

  static final int SVG_PRESERVEASPECTRATIO_XMINYMAX = 8;

  static final int SVG_PRESERVEASPECTRATIO_XMINYMID = 5;

  static final int SVG_PRESERVEASPECTRATIO_XMINYMIN = 2;

  int get align();

  void set align(int value);

  int get meetOrSlice();

  void set meetOrSlice(int value);
}
