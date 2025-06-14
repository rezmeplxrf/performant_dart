import 'package:benchmark_harness/benchmark_harness.dart';

// Custom class for object testing
class TestObject {
  final int id;
  final String name;
  
  TestObject(this.id, this.name);
}

// Base class with shared test data
abstract class ListCreationBenchmark extends BenchmarkBase {
  late List<int> sourceInts;
  late List<String> sourceStrings;
  late List<TestObject> sourceObjects;
  late List<Map<String, dynamic>> sourceMaps;

  ListCreationBenchmark(super.name);

  @override
  void setup() {
    // Create source lists with 1000 items for testing
    sourceInts = List.generate(1000, (index) => index);
    sourceStrings = List.generate(1000, (index) => 'item_$index');
    sourceObjects = List.generate(1000, (index) => TestObject(index, 'object_$index'));
    sourceMaps = List.generate(1000, (index) => {'id': index, 'value': 'map_$index'});
  }
}

// Integer benchmarks
class FixedListFromBenchmark extends ListCreationBenchmark {
  FixedListFromBenchmark() : super('FixedListFrom_Int');

  @override
  void run() {
    final fixedList = List<int>.from(sourceInts, growable: false);
    // Prevent compiler optimization by accessing the list
    if (fixedList.isEmpty) throw StateError('Should not be empty');
  }
}

class SpreadOperatorBenchmark extends ListCreationBenchmark {
  SpreadOperatorBenchmark() : super('SpreadOperator_Int');

  @override
  void run() {
    final spreadList = [...sourceInts];
    // Prevent compiler optimization by accessing the list
    if (spreadList.isEmpty) throw StateError('Should not be empty');
  }
}

// String benchmarks
class FixedListFromStringBenchmark extends ListCreationBenchmark {
  FixedListFromStringBenchmark() : super('FixedListFrom_String');

  @override
  void run() {
    final fixedList = List<String>.from(sourceStrings, growable: false);
    // Prevent compiler optimization by accessing the list
    if (fixedList.isEmpty) throw StateError('Should not be empty');
  }
}

class SpreadOperatorStringBenchmark extends ListCreationBenchmark {
  SpreadOperatorStringBenchmark() : super('SpreadOperator_String');

  @override
  void run() {
    final spreadList = [...sourceStrings];
    // Prevent compiler optimization by accessing the list
    if (spreadList.isEmpty) throw StateError('Should not be empty');
  }
}

// Custom object benchmarks
class FixedListFromObjectBenchmark extends ListCreationBenchmark {
  FixedListFromObjectBenchmark() : super('FixedListFrom_Object');

  @override
  void run() {
    final fixedList = List<TestObject>.from(sourceObjects, growable: false);
    // Prevent compiler optimization by accessing the list
    if (fixedList.isEmpty) throw StateError('Should not be empty');
  }
}

class SpreadOperatorObjectBenchmark extends ListCreationBenchmark {
  SpreadOperatorObjectBenchmark() : super('SpreadOperator_Object');

  @override
  void run() {
    final spreadList = [...sourceObjects];
    // Prevent compiler optimization by accessing the list
    if (spreadList.isEmpty) throw StateError('Should not be empty');
  }
}

// Map benchmarks
class FixedListFromMapBenchmark extends ListCreationBenchmark {
  FixedListFromMapBenchmark() : super('FixedListFrom_Map');

  @override
  void run() {
    final fixedList = List<Map<String, dynamic>>.from(sourceMaps, growable: false);
    // Prevent compiler optimization by accessing the list
    if (fixedList.isEmpty) throw StateError('Should not be empty');
  }
}

class SpreadOperatorMapBenchmark extends ListCreationBenchmark {
  SpreadOperatorMapBenchmark() : super('SpreadOperator_Map');

  @override
  void run() {
    final spreadList = [...sourceMaps];
    // Prevent compiler optimization by accessing the list
    if (spreadList.isEmpty) throw StateError('Should not be empty');
  }
}

void main() {
  print('List Creation Benchmarks:');
  print('=' * 50);

  // Integer benchmarks
  print('\nInteger Lists:');
  FixedListFromBenchmark().report();
  SpreadOperatorBenchmark().report();
  
  // String benchmarks
  print('\nString Lists:');
  FixedListFromStringBenchmark().report();
  SpreadOperatorStringBenchmark().report();
  
  // Custom object benchmarks
  print('\nCustom Object Lists:');
  FixedListFromObjectBenchmark().report();
  SpreadOperatorObjectBenchmark().report();
  
  // Map benchmarks
  print('\nMap Lists:');
  FixedListFromMapBenchmark().report();
  SpreadOperatorMapBenchmark().report();
}
