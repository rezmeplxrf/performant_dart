import 'dart:collection';
import 'package:benchmark_harness/benchmark_harness.dart';

// Base data for consistent benchmarking
final List<int> sourceData = List.generate(1000, (i) => i);

// Set creation benchmarks
class SetFromBenchmark extends BenchmarkBase {
  SetFromBenchmark() : super('Set.from()');

  @override
  void run() {
    Set.from(sourceData);
  }
}

class SetConstructorBenchmark extends BenchmarkBase {
  SetConstructorBenchmark() : super('Set.of()');

  @override
  void run() {
    Set.of(sourceData);
  }
}

class HashSetConstructorBenchmark extends BenchmarkBase {
  HashSetConstructorBenchmark() : super('HashSet()');

  @override
  void run() {
    HashSet<int>()..addAll(sourceData);
  }
}

class HashSetFromBenchmark extends BenchmarkBase {
  HashSetFromBenchmark() : super('HashSet.from()');

  @override
  void run() {
    HashSet.from(sourceData);
  }
}

// List creation benchmarks
class ListFromBenchmark extends BenchmarkBase {
  ListFromBenchmark() : super('List.from()');

  @override
  void run() {
    List.from(sourceData);
  }
}

class ListConstructorBenchmark extends BenchmarkBase {
  ListConstructorBenchmark() : super('List.of()');

  @override
  void run() {
    List.of(sourceData);
  }
}

class ListLiteralBenchmark extends BenchmarkBase {
  ListLiteralBenchmark() : super('[]');

  @override
  void run() {
    [...sourceData];
  }
}

void main() {
  print('Iterable Creation Benchmarks');
  print('============================');

  print('\nSet Creation:');
  SetFromBenchmark().report();
  SetConstructorBenchmark().report();
  HashSetConstructorBenchmark().report();
  HashSetFromBenchmark().report();

  print('\nList Creation:');
  ListFromBenchmark().report();
  ListConstructorBenchmark().report();
  ListLiteralBenchmark().report();
}
