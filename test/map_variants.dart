import 'dart:collection';
import 'dart:math';
import 'package:benchmark_harness/benchmark_harness.dart';

// Base class for map benchmarks
abstract class MapBenchmark extends BenchmarkBase {
  late List<String> keys;
  late List<int> values;
  final int size;

  MapBenchmark(super.name, this.size);

  @override
  void setup() {
    final random = Random(42); // Fixed seed for consistency
    keys = List.generate(size, (i) => 'key_$i');
    values = List.generate(size, (i) => random.nextInt(1000000));
  }
}

// Map Insert Benchmarks
class MapInsertBenchmark extends MapBenchmark {
  MapInsertBenchmark(int size) : super('Map Insert ($size items)', size);

  @override
  void run() {
    final map = <String, int>{};
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }
}

class HashMapInsertBenchmark extends MapBenchmark {
  HashMapInsertBenchmark(int size)
    : super('HashMap Insert ($size items)', size);

  @override
  void run() {
    final map = HashMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }
}

class LinkedHashMapInsertBenchmark extends MapBenchmark {
  LinkedHashMapInsertBenchmark(int size)
    : super('LinkedHashMap Insert ($size items)', size);

  @override
  void run() {
    final map = LinkedHashMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }
}

class SplayTreeMapInsertBenchmark extends MapBenchmark {
  SplayTreeMapInsertBenchmark(int size)
    : super('SplayTreeMap Insert ($size items)', size);

  @override
  void run() {
    final map = SplayTreeMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }
}

// Map Lookup Benchmarks
class MapLookupBenchmark extends MapBenchmark {
  late Map<String, int> map;

  MapLookupBenchmark(int size) : super('Map Lookup ($size items)', size);

  @override
  void setup() {
    super.setup();
    map = <String, int>{};
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      map[keys[i]];
    }
  }
}

class HashMapLookupBenchmark extends MapBenchmark {
  late HashMap<String, int> map;

  HashMapLookupBenchmark(int size)
    : super('HashMap Lookup ($size items)', size);

  @override
  void setup() {
    super.setup();
    map = HashMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      map[keys[i]];
    }
  }
}

class LinkedHashMapLookupBenchmark extends MapBenchmark {
  late LinkedHashMap<String, int> map;

  LinkedHashMapLookupBenchmark(int size)
    : super('LinkedHashMap Lookup ($size items)', size);

  @override
  void setup() {
    super.setup();
    map = LinkedHashMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      map[keys[i]];
    }
  }
}

class SplayTreeMapLookupBenchmark extends MapBenchmark {
  late SplayTreeMap<String, int> map;

  SplayTreeMapLookupBenchmark(int size)
    : super('SplayTreeMap Lookup ($size items)', size);

  @override
  void setup() {
    super.setup();
    map = SplayTreeMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      map[keys[i]];
    }
  }
}

// Map Iteration Benchmarks
class MapIterationBenchmark extends MapBenchmark {
  late Map<String, int> map;

  MapIterationBenchmark(int size) : super('Map Iteration ($size items)', size);

  @override
  void setup() {
    super.setup();
    map = <String, int>{};
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }

  @override
  void run() {
    for (final entry in map.entries) {
      // Access key and value to ensure iteration work
      entry.key.length + entry.value;
    }
  }
}

class HashMapIterationBenchmark extends MapBenchmark {
  late HashMap<String, int> map;

  HashMapIterationBenchmark(int size)
    : super('HashMap Iteration ($size items)', size);

  @override
  void setup() {
    super.setup();
    map = HashMap<String, int>();
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
  }

  @override
  void run() {
    for (final entry in map.entries) {
      entry.key.length + entry.value;
    }
  }
}

// Map Deletion Benchmarks
class MapDeletionBenchmark extends MapBenchmark {
  MapDeletionBenchmark(int size) : super('Map Deletion ($size items)', size);

  @override
  void run() {
    final map = <String, int>{};
    // Insert items
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
    // Delete items
    for (int i = 0; i < size; i++) {
      map.remove(keys[i]);
    }
  }
}

class HashMapDeletionBenchmark extends MapBenchmark {
  HashMapDeletionBenchmark(int size)
    : super('HashMap Deletion ($size items)', size);

  @override
  void run() {
    final map = HashMap<String, int>();
    // Insert items
    for (int i = 0; i < size; i++) {
      map[keys[i]] = values[i];
    }
    // Delete items
    for (int i = 0; i < size; i++) {
      map.remove(keys[i]);
    }
  }
}

// Base class for list benchmarks
abstract class ListBenchmark extends BenchmarkBase {
  late List<String> keys;
  late List<int> values;
  final int size;

  ListBenchmark(super.name, this.size);

  @override
  void setup() {
    final random = Random(42); // Fixed seed for consistency
    keys = List.generate(size, (i) => 'key_$i');
    values = List.generate(size, (i) => random.nextInt(1000000));
  }
}

// List Insert Benchmarks
class ListInsertBenchmark extends ListBenchmark {
  ListInsertBenchmark(int size) : super('List Insert ($size items)', size);

  @override
  void run() {
    final list = <String>[];
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
  }
}

class ListInsertAtBenchmark extends ListBenchmark {
  ListInsertAtBenchmark(int size) : super('List InsertAt ($size items)', size);

  @override
  void run() {
    final list = <String>[];
    for (int i = 0; i < size; i++) {
      list.insert(0, keys[i]); // Insert at beginning (worst case)
    }
  }
}

// List Lookup Benchmarks
class ListIndexOfBenchmark extends ListBenchmark {
  late List<String> list;

  ListIndexOfBenchmark(int size) : super('List IndexOf ($size items)', size);

  @override
  void setup() {
    super.setup();
    list = <String>[];
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      list.indexOf(keys[i]);
    }
  }
}

class ListContainsBenchmark extends ListBenchmark {
  late List<String> list;

  ListContainsBenchmark(int size) : super('List Contains ($size items)', size);

  @override
  void setup() {
    super.setup();
    list = <String>[];
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      list.contains(keys[i]);
    }
  }
}

class ListIndexAccessBenchmark extends ListBenchmark {
  late List<String> list;

  ListIndexAccessBenchmark(int size)
    : super('List Index Access ($size items)', size);

  @override
  void setup() {
    super.setup();
    list = <String>[];
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
  }

  @override
  void run() {
    for (int i = 0; i < size; i++) {
      list[i];
    }
  }
}

// List Iteration Benchmarks
class ListIterationBenchmark extends ListBenchmark {
  late List<String> list;

  ListIterationBenchmark(int size)
    : super('List Iteration ($size items)', size);

  @override
  void setup() {
    super.setup();
    list = <String>[];
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
  }

  @override
  void run() {
    for (final item in list) {
      item.length; // Access item to ensure iteration work
    }
  }
}

// List Deletion Benchmarks
class ListRemoveBenchmark extends ListBenchmark {
  ListRemoveBenchmark(int size) : super('List Remove ($size items)', size);

  @override
  void run() {
    final list = <String>[];
    // Insert items
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
    // Remove items by value
    for (int i = 0; i < size; i++) {
      list.remove(keys[i]);
    }
  }
}

class ListRemoveAtBenchmark extends ListBenchmark {
  ListRemoveAtBenchmark(int size) : super('List RemoveAt ($size items)', size);

  @override
  void run() {
    final list = <String>[];
    // Insert items
    for (int i = 0; i < size; i++) {
      list.add(keys[i]);
    }
    // Remove items by index (from end to avoid index shifting)
    for (int i = size - 1; i >= 0; i--) {
      list.removeAt(i);
    }
  }
}

void main() {
  final sizes = [100, 1000, 10000];

  print(
    '=== Map vs HashMap vs LinkedHashMap vs SplayTreeMap vs List Performance Tests ===\n',
  );

  for (final size in sizes) {
    print('--- Size: $size ---');

    // Insert benchmarks
    print('Insert Operations:');
    MapInsertBenchmark(size).report();
    HashMapInsertBenchmark(size).report();
    LinkedHashMapInsertBenchmark(size).report();
    SplayTreeMapInsertBenchmark(size).report();
    ListInsertBenchmark(size).report();
    ListInsertAtBenchmark(size).report();
    print('');

    // Lookup benchmarks
    print('Lookup Operations:');
    MapLookupBenchmark(size).report();
    HashMapLookupBenchmark(size).report();
    LinkedHashMapLookupBenchmark(size).report();
    SplayTreeMapLookupBenchmark(size).report();
    ListIndexOfBenchmark(size).report();
    ListContainsBenchmark(size).report();
    ListIndexAccessBenchmark(size).report();
    print('');

    // Iteration benchmarks
    print('Iteration Operations:');
    MapIterationBenchmark(size).report();
    HashMapIterationBenchmark(size).report();
    ListIterationBenchmark(size).report();
    print('');

    // Deletion benchmarks
    print('Deletion Operations:');
    MapDeletionBenchmark(size).report();
    HashMapDeletionBenchmark(size).report();
    ListRemoveBenchmark(size).report();
    ListRemoveAtBenchmark(size).report();
    print('');
  }
}
