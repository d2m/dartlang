// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/**
 * A simple [Stopwatch] interface to measure elapsed time.
 */
interface Stopwatch factory StopwatchImplementation {

  /**
   * Creates a [Stopwatch] in stopped state with a zero elapsed count.
   */
  Stopwatch();

  /**
   * Creates a [Stopwatch] in started state with a zero elapsed count.
   */
  Stopwatch.start();

  /**
   * Starts the [Stopwatch]. The [elapsed] count is increasing monotonically.
   * If the [Stopwatch] has been stopped, then calling start again restarts it
   * without resetting the [elapsed] count.
   * If the [Stopwatch] is currently running, then calling start does nothing.
   */
  void start();

  /**
   * Stops the [Stopwatch]. The [elapsed] count stops increasing.
   * If the [Stopwatch] is currently not running, then calling stop does
   * nothing.
   */
  void stop();

  /**
   * Resets the [elapsed] count to zero. This method does not stop or start
   * the [Stopwatch].
   */
  void reset();

  /**
   * Returns the elapsed number of clock ticks since calling [start] while the
   * [Stopwatch] is running.
   * Returns the elapsed number of clock ticks between calling [start] and
   * calling [stop].
   * Returns 0 if the [Stopwatch] has never been started.
   * The elapsed number of clock ticks increases by [frequency] every second.
   */
  int elapsed();

  /**
   * Returns the [elapsed] counter converted to microseconds.
   */
  int elapsedInUs();

  /**
   * Returns the [elapsed] counter converted to milliseconds.
   */
  int elapsedInMs();

  /**
   * Returns the frequency of the elapsed counter in Hz.
   */
  int frequency();

}
