// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// WARNING: Do not edit - generated code.

interface DedicatedWorkerGlobalScope extends WorkerContext {

  void postMessage(Object message, [List messagePorts]);

  void webkitPostMessage(Object message, [List transferList]);
}

interface DedicatedWorkerContext extends DedicatedWorkerGlobalScope {
}
