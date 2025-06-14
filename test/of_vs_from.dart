import 'package:benchmark_harness/benchmark_harness.dart';
import 'dart:collection';

// Test data - consistent across all benchmarks
final Iterable<int> testIterable = Iterable.generate(10000, (index) => index);

// HashSet benchmarks
class HashSetOfBenchmark extends BenchmarkBase {
  const HashSetOfBenchmark() : super('HashSet.of()');

  @override
  void run() {
    HashSet.of(testIterable);
  }
}

class HashSetFromBenchmark extends BenchmarkBase {
  const HashSetFromBenchmark() : super('HashSet.from()');

  @override
  void run() {
    HashSet.from(testIterable);
  }
}

// List benchmarks
class ListOfBenchmark extends BenchmarkBase {
  const ListOfBenchmark() : super('List.of()');

  @override
  void run() {
    List.of(testIterable);
  }
}

class ListFromBenchmark extends BenchmarkBase {
  const ListFromBenchmark() : super('List.from()');

  @override
  void run() {
    List.from(testIterable);
  }
}

// Set benchmarks
class SetOfBenchmark extends BenchmarkBase {
  const SetOfBenchmark() : super('Set.of()');

  @override
  void run() {
    Set.of(testIterable);
  }
}

class SetFromBenchmark extends BenchmarkBase {
  const SetFromBenchmark() : super('Set.from()');

  @override
  void run() {
    Set.from(testIterable);
  }
}

// LinkedHashSet benchmarks
class LinkedHashSetOfBenchmark extends BenchmarkBase {
  const LinkedHashSetOfBenchmark() : super('LinkedHashSet.of()');

  @override
  void run() {
    LinkedHashSet.of(testIterable);
  }
}

class LinkedHashSetFromBenchmark extends BenchmarkBase {
  const LinkedHashSetFromBenchmark() : super('LinkedHashSet.from()');

  @override
  void run() {
    LinkedHashSet.from(testIterable);
  }
}

// SplayTreeSet benchmarks
class SplayTreeSetOfBenchmark extends BenchmarkBase {
  const SplayTreeSetOfBenchmark() : super('SplayTreeSet.of()');

  @override
  void run() {
    SplayTreeSet.of(testIterable);
  }
}

class SplayTreeSetFromBenchmark extends BenchmarkBase {
  const SplayTreeSetFromBenchmark() : super('SplayTreeSet.from()');

  @override
  void run() {
    SplayTreeSet.from(testIterable);
  }
}

void main() {
  print('Collection Creation Benchmarks: .of() vs .from()');
  print('Test data size: ${testIterable.length} elements\n');

  // HashSet benchmarks
  print('=== HashSet ===');
  HashSetOfBenchmark().report();
  HashSetFromBenchmark().report();
  print('');

  // List benchmarks
  print('=== List ===');
  ListOfBenchmark().report();
  ListFromBenchmark().report();
  print('');

  // Set benchmarks
  print('=== Set ===');
  SetOfBenchmark().report();
  SetFromBenchmark().report();
  print('');

  // LinkedHashSet benchmarks
  print('=== LinkedHashSet ===');
  LinkedHashSetOfBenchmark().report();
  LinkedHashSetFromBenchmark().report();
  print('');

  // SplayTreeSet benchmarks
  print('=== SplayTreeSet ===');
  SplayTreeSetOfBenchmark().report();
  SplayTreeSetFromBenchmark().report();
}
