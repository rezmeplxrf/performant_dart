import 'dart:collection';
import 'package:benchmark_harness/benchmark_harness.dart';

// Base data for all collections
const int dataSize = 10000;
final List<int> baseData = List.generate(dataSize, (index) => index);

class ListLoopingBenchmark extends BenchmarkBase {
  late List<int> list;

  ListLoopingBenchmark() : super('List Looping');

  @override
  void setup() {
    list = List.from(baseData);
  }

  @override
  void run() {
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += list[i];
    }
  }
}

class ListGrowableFalseLoopingBenchmark extends BenchmarkBase {
  late List<int> list;

  ListGrowableFalseLoopingBenchmark() : super('List(growable=false) Looping');

  @override
  void setup() {
    list = List.from(baseData, growable: false);
  }

  @override
  void run() {
    int sum = 0;
    for (int i = 0; i < list.length; i++) {
      sum += list[i];
    }
  }
}

class SetLoopingBenchmark extends BenchmarkBase {
  late Set<int> set;

  SetLoopingBenchmark() : super('Set Looping');

  @override
  void setup() {
    set = Set.from(baseData);
  }

  @override
  void run() {
    int sum = 0;
    for (int value in set) {
      sum += value;
    }
  }
}

class HashSetLoopingBenchmark extends BenchmarkBase {
  late HashSet<int> hashSet;

  HashSetLoopingBenchmark() : super('HashSet Looping');

  @override
  void setup() {
    hashSet = HashSet.from(baseData);
  }

  @override
  void run() {
    int sum = 0;
    for (int value in hashSet) {
      sum += value;
    }
  }
}

class LinkedHashSetLoopingBenchmark extends BenchmarkBase {
  late LinkedHashSet<int> linkedHashSet;

  LinkedHashSetLoopingBenchmark() : super('LinkedHashSet Looping');

  @override
  void setup() {
    linkedHashSet = LinkedHashSet.from(baseData);
  }

  @override
  void run() {
    int sum = 0;
    for (int value in linkedHashSet) {
      sum += value;
    }
  }
}

class IterableLoopingBenchmark extends BenchmarkBase {
  late Iterable<int> iterable;

  IterableLoopingBenchmark() : super('Iterable Looping');

  @override
  void setup() {
    iterable = baseData.where((element) => true); // Create a lazy iterable
  }

  @override
  void run() {
    int sum = 0;
    for (int value in iterable) {
      sum += value;
    }
  }
}

class MapEntriesLoopingBenchmark extends BenchmarkBase {
  late Map<int, int> map;

  MapEntriesLoopingBenchmark() : super('Map.entries Looping');

  @override
  void setup() {
    map = Map.fromIterable(baseData, key: (e) => e, value: (e) => e);
  }

  @override
  void run() {
    int sum = 0;
    for (MapEntry<int, int> entry in map.entries) {
      sum += entry.value;
    }
  }
}

class MapKeysLoopingBenchmark extends BenchmarkBase {
  late Map<int, int> map;

  MapKeysLoopingBenchmark() : super('Map.keys Looping');

  @override
  void setup() {
    map = Map.fromIterable(baseData, key: (e) => e, value: (e) => e);
  }

  @override
  void run() {
    int sum = 0;
    for (int key in map.keys) {
      sum += map[key]!;
    }
  }
}

class MapValuesLoopingBenchmark extends BenchmarkBase {
  late Map<int, int> map;

  MapValuesLoopingBenchmark() : super('Map.values Looping');

  @override
  void setup() {
    map = Map.fromIterable(baseData, key: (e) => e, value: (e) => e);
  }

  @override
  void run() {
    int sum = 0;
    for (int value in map.values) {
      sum += value;
    }
  }
}

void runCollectionLoopingBenchmarks() {
  print('Collection Looping Performance Benchmarks');
  print('=' * 50);

  ListLoopingBenchmark().report();
  ListGrowableFalseLoopingBenchmark().report();
  SetLoopingBenchmark().report();
  HashSetLoopingBenchmark().report();
  LinkedHashSetLoopingBenchmark().report();
  IterableLoopingBenchmark().report();
  MapEntriesLoopingBenchmark().report();
  MapKeysLoopingBenchmark().report();
  MapValuesLoopingBenchmark().report();
}

void main () {
  runCollectionLoopingBenchmarks();
}