import 'dart:collection';
import 'package:benchmark_harness/benchmark_harness.dart';

// Test data constants
const int testSize = 10000;
final List<int> testData = List.generate(testSize, (i) => i);
final List<int> lookupData = List.generate(1000, (i) => i * 2);

// HashSet Benchmarks
class HashSetCreationBenchmark extends BenchmarkBase {
  HashSetCreationBenchmark() : super('HashSet Creation');

  @override
  void run() {
    final set = HashSet<int>();
    for (final item in testData) {
      set.add(item);
    }
  }
}

class HashSetLookupBenchmark extends BenchmarkBase {
  late HashSet<int> set;

  HashSetLookupBenchmark() : super('HashSet Lookup');

  @override
  void setup() {
    set = HashSet<int>.from(testData);
  }

  @override
  void run() {
    for (final item in lookupData) {
      set.contains(item);
    }
  }
}

class HashSetModificationBenchmark extends BenchmarkBase {
  late HashSet<int> set;

  HashSetModificationBenchmark() : super('HashSet Modification');

  @override
  void setup() {
    set = HashSet<int>.from(testData);
  }

  @override
  void run() {
    for (int i = 0; i < 1000; i++) {
      set.add(testSize + i);
      set.remove(i);
    }
  }

  @override
  void teardown() {
    set.clear();
  }
}

// LinkedHashSet Benchmarks
class LinkedHashSetCreationBenchmark extends BenchmarkBase {
  LinkedHashSetCreationBenchmark() : super('LinkedHashSet Creation');

  @override
  void run() {
    final set = LinkedHashSet<int>();
    for (final item in testData) {
      set.add(item);
    }
  }
}

class LinkedHashSetLookupBenchmark extends BenchmarkBase {
  late LinkedHashSet<int> set;

  LinkedHashSetLookupBenchmark() : super('LinkedHashSet Lookup');

  @override
  void setup() {
    set = LinkedHashSet<int>.from(testData);
  }

  @override
  void run() {
    for (final item in lookupData) {
      set.contains(item);
    }
  }
}

class LinkedHashSetModificationBenchmark extends BenchmarkBase {
  late LinkedHashSet<int> set;

  LinkedHashSetModificationBenchmark() : super('LinkedHashSet Modification');

  @override
  void setup() {
    set = LinkedHashSet<int>.from(testData);
  }

  @override
  void run() {
    for (int i = 0; i < 1000; i++) {
      set.add(testSize + i);
      set.remove(i);
    }
  }

  @override
  void teardown() {
    set.clear();
  }
}

// SplayTreeSet Benchmarks
class SplayTreeSetCreationBenchmark extends BenchmarkBase {
  SplayTreeSetCreationBenchmark() : super('SplayTreeSet Creation');

  @override
  void run() {
    final set = SplayTreeSet<int>();
    for (final item in testData) {
      set.add(item);
    }
  }
}

class SplayTreeSetLookupBenchmark extends BenchmarkBase {
  late SplayTreeSet<int> set;

  SplayTreeSetLookupBenchmark() : super('SplayTreeSet Lookup');

  @override
  void setup() {
    set = SplayTreeSet<int>.from(testData);
  }

  @override
  void run() {
    for (final item in lookupData) {
      set.contains(item);
    }
  }
}

class SplayTreeSetModificationBenchmark extends BenchmarkBase {
  late SplayTreeSet<int> set;

  SplayTreeSetModificationBenchmark() : super('SplayTreeSet Modification');

  @override
  void setup() {
    set = SplayTreeSet<int>.from(testData);
  }

  @override
  void run() {
    for (int i = 0; i < 1000; i++) {
      set.add(testSize + i);
      set.remove(i);
    }
  }

  @override
  void teardown() {
    set.clear();
  }
}

// UnmodifiableSetView Benchmarks
class UnmodifiableSetViewCreationBenchmark extends BenchmarkBase {
  UnmodifiableSetViewCreationBenchmark()
    : super('UnmodifiableSetView Creation');

  @override
  void run() {
    final baseSet = HashSet<int>.from(testData);
    final unmodifiableSet = UnmodifiableSetView<int>(baseSet);
    // Force usage to prevent optimization
    unmodifiableSet.length;
  }
}

class UnmodifiableSetViewLookupBenchmark extends BenchmarkBase {
  late UnmodifiableSetView<int> set;

  UnmodifiableSetViewLookupBenchmark() : super('UnmodifiableSetView Lookup');

  @override
  void setup() {
    final baseSet = HashSet<int>.from(testData);
    set = UnmodifiableSetView<int>(baseSet);
  }

  @override
  void run() {
    for (final item in lookupData) {
      set.contains(item);
    }
  }
}

// Set.unmodifiable Benchmarks
class SetUnmodifiableCreationBenchmark extends BenchmarkBase {
  SetUnmodifiableCreationBenchmark() : super('Set.unmodifiable Creation');

  @override
  void run() {
    final unmodifiableSet = Set<int>.unmodifiable(testData);
    // Force usage to prevent optimization
    unmodifiableSet.length;
  }
}

class SetUnmodifiableLookupBenchmark extends BenchmarkBase {
  late Set<int> set;

  SetUnmodifiableLookupBenchmark() : super('Set.unmodifiable Lookup');

  @override
  void setup() {
    set = Set<int>.unmodifiable(testData);
  }

  @override
  void run() {
    for (final item in lookupData) {
      set.contains(item);
    }
  }
}

// Default Set Benchmarks
class DefaultSetCreationBenchmark extends BenchmarkBase {
  DefaultSetCreationBenchmark() : super('Default Set Creation');

  @override
  void run() {
    final set = <int>{};
    for (final item in testData) {
      set.add(item);
    }
  }
}

class DefaultSetLookupBenchmark extends BenchmarkBase {
  late Set<int> set;

  DefaultSetLookupBenchmark() : super('Default Set Lookup');

  @override
  void setup() {
    set = Set<int>.from(testData);
  }

  @override
  void run() {
    for (final item in lookupData) {
      set.contains(item);
    }
  }
}

class DefaultSetModificationBenchmark extends BenchmarkBase {
  late Set<int> set;

  DefaultSetModificationBenchmark() : super('Default Set Modification');

  @override
  void setup() {
    set = Set<int>.from(testData);
  }

  @override
  void run() {
    for (int i = 0; i < 1000; i++) {
      set.add(testSize + i);
      set.remove(i);
    }
  }

  @override
  void teardown() {
    set.clear();
  }
}

// List (growable) Benchmarks
class ListGrowableCreationBenchmark extends BenchmarkBase {
  ListGrowableCreationBenchmark() : super('List (growable) Creation');

  @override
  void run() {
    final list = <int>[];
    for (final item in testData) {
      list.add(item);
    }
  }
}

class ListGrowableLookupBenchmark extends BenchmarkBase {
  late List<int> list;

  ListGrowableLookupBenchmark() : super('List (growable) Lookup');

  @override
  void setup() {
    list = List<int>.from(testData, growable: true);
  }

  @override
  void run() {
    for (final item in lookupData) {
      list.contains(item);
    }
  }
}

class ListGrowableModificationBenchmark extends BenchmarkBase {
  late List<int> list;

  ListGrowableModificationBenchmark() : super('List (growable) Modification');

  @override
  void setup() {
    list = List<int>.from(testData, growable: true);
  }

  @override
  void run() {
    for (int i = 0; i < 1000; i++) {
      list.add(testSize + i);
      if (list.isNotEmpty) {
        list.removeAt(0);
      }
    }
  }

  @override
  void teardown() {
    list.clear();
  }
}

// List (growable=false) Benchmarks
class ListFixedCreationBenchmark extends BenchmarkBase {
  ListFixedCreationBenchmark() : super('List (growable=false) Creation');

  @override
  void run() {
    final list = List<int>.filled(testSize, 0, growable: false);
    for (int i = 0; i < testData.length; i++) {
      list[i] = testData[i];
    }
  }
}

class ListFixedLookupBenchmark extends BenchmarkBase {
  late List<int> list;

  ListFixedLookupBenchmark() : super('List (growable=false) Lookup');

  @override
  void setup() {
    list = List<int>.from(testData, growable: false);
  }

  @override
  void run() {
    for (final item in lookupData) {
      list.contains(item);
    }
  }
}

class ListFixedModificationBenchmark extends BenchmarkBase {
  late List<int> list;

  ListFixedModificationBenchmark()
    : super('List (growable=false) Modification');

  @override
  void setup() {
    list = List<int>.from(testData, growable: false);
  }

  @override
  void run() {
    for (int i = 0; i < 1000; i++) {
      // Only modify existing elements since fixed-length lists can't grow
      final index = i % list.length;
      list[index] = testSize + i;
    }
  }
}

// Iterable Benchmarks
class IterableCreationBenchmark extends BenchmarkBase {
  IterableCreationBenchmark() : super('Iterable Creation');

  @override
  void run() {
    final iterable = testData.map((item) => item);
    // Force evaluation to prevent lazy optimization
    iterable.length;
  }
}

class IterableLookupBenchmark extends BenchmarkBase {
  late Iterable<int> iterable;

  IterableLookupBenchmark() : super('Iterable Lookup');

  @override
  void setup() {
    iterable = testData.map((item) => item);
  }

  @override
  void run() {
    for (final item in lookupData) {
      iterable.contains(item);
    }
  }
}

class IterableModificationBenchmark extends BenchmarkBase {
  IterableModificationBenchmark() : super('Iterable Modification');

  @override
  void run() {
    // Iterable doesn't support direct modification, so we test transformation
    var iterable = testData.map((item) => item);
    for (int i = 0; i < 1000; i++) {
      iterable = iterable.map((item) => item + 1);
    }
    // Force evaluation to prevent lazy optimization
    iterable.length;
  }
}

void main() {
  print('Running Set Performance Benchmarks...\n');

  // Creation benchmarks
  print('=== Creation Benchmarks ===');
  HashSetCreationBenchmark().report();
  LinkedHashSetCreationBenchmark().report();
  SplayTreeSetCreationBenchmark().report();
  UnmodifiableSetViewCreationBenchmark().report();
  SetUnmodifiableCreationBenchmark().report();
  DefaultSetCreationBenchmark().report();
  ListGrowableCreationBenchmark().report();
  ListFixedCreationBenchmark().report();
  IterableCreationBenchmark().report();

  print('\n=== Lookup Benchmarks ===');
  HashSetLookupBenchmark().report();
  LinkedHashSetLookupBenchmark().report();
  SplayTreeSetLookupBenchmark().report();
  UnmodifiableSetViewLookupBenchmark().report();
  SetUnmodifiableLookupBenchmark().report();
  DefaultSetLookupBenchmark().report();
  ListGrowableLookupBenchmark().report();
  ListFixedLookupBenchmark().report();
  IterableLookupBenchmark().report();

  print('\n=== Modification Benchmarks ===');
  HashSetModificationBenchmark().report();
  LinkedHashSetModificationBenchmark().report();
  SplayTreeSetModificationBenchmark().report();
  DefaultSetModificationBenchmark().report();
  ListGrowableModificationBenchmark().report();
  ListFixedModificationBenchmark().report();
  IterableModificationBenchmark().report();

  print(
    '\nNote: UnmodifiableSetView and Set.unmodifiable do not support modification operations.',
  );
  print(
    'List (growable=false) modification only changes existing elements, not add/remove operations.',
  );
  print(
    'Iterable modification tests transformation operations since direct modification is not supported.',
  );
}
