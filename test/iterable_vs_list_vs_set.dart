import 'package:benchmark_harness/benchmark_harness.dart';

class CustomObject {
  final int id;
  final String name;
  
  CustomObject(this.id, this.name);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomObject && other.id == id && other.name == name;
  
  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

// Creation benchmarks - Int
class ListIntCreationBenchmark extends BenchmarkBase {
  ListIntCreationBenchmark() : super('List<int> creation');
  
  @override
  void run() {
    final list = <int>[];
    for (int i = 0; i < 1000; i++) {
      list.add(i);
    }
  }
}

class SetIntCreationBenchmark extends BenchmarkBase {
  SetIntCreationBenchmark() : super('Set<int> creation');
  
  @override
  void run() {
    final set = <int>{};
    for (int i = 0; i < 1000; i++) {
      set.add(i);
    }
  }
}

class IterableIntCreationBenchmark extends BenchmarkBase {
  IterableIntCreationBenchmark() : super('Iterable<int> creation');
  
  @override
  void run() {
    final iterable = Iterable.generate(1000, (i) => i);
    // Force evaluation to ensure fair comparison
    iterable.toList();
  }
}

// Lookup benchmarks - Int
class ListIntLookupBenchmark extends BenchmarkBase {
  late List<int> list;
  
  ListIntLookupBenchmark() : super('List<int> lookup');
  
  @override
  void setup() {
    list = List.generate(1000, (i) => i);
  }
  
  @override
  void run() {
    for (int i = 0; i < 100; i++) {
      list.contains(i);
    }
  }
}

class SetIntLookupBenchmark extends BenchmarkBase {
  late Set<int> set;
  
  SetIntLookupBenchmark() : super('Set<int> lookup');
  
  @override
  void setup() {
    set = Set.from(List.generate(1000, (i) => i));
  }
  
  @override
  void run() {
    for (int i = 0; i < 100; i++) {
      set.contains(i);
    }
  }
}

class IterableIntLookupBenchmark extends BenchmarkBase {
  late Iterable<int> iterable;
  
  IterableIntLookupBenchmark() : super('Iterable<int> lookup');
  
  @override
  void setup() {
    iterable = Iterable.generate(1000, (i) => i);
  }
  
  @override
  void run() {
    for (int i = 0; i < 100; i++) {
      iterable.contains(i);
    }
  }
}

// Removal benchmarks - Int
class ListIntRemovalBenchmark extends BenchmarkBase {
  ListIntRemovalBenchmark() : super('List<int> removal');
  
  @override
  void run() {
    final list = List.generate(1000, (i) => i);
    for (int i = 0; i < 100; i++) {
      list.remove(i);
    }
  }
}

class SetIntRemovalBenchmark extends BenchmarkBase {
  SetIntRemovalBenchmark() : super('Set<int> removal');
  
  @override
  void run() {
    final set = Set.from(List.generate(1000, (i) => i));
    for (int i = 0; i < 100; i++) {
      set.remove(i);
    }
  }
}

// Creation benchmarks - String
class ListStringCreationBenchmark extends BenchmarkBase {
  ListStringCreationBenchmark() : super('List<String> creation');
  
  @override
  void run() {
    final list = <String>[];
    for (int i = 0; i < 1000; i++) {
      list.add('item$i');
    }
  }
}

class SetStringCreationBenchmark extends BenchmarkBase {
  SetStringCreationBenchmark() : super('Set<String> creation');
  
  @override
  void run() {
    final set = <String>{};
    for (int i = 0; i < 1000; i++) {
      set.add('item$i');
    }
  }
}

class IterableStringCreationBenchmark extends BenchmarkBase {
  IterableStringCreationBenchmark() : super('Iterable<String> creation');
  
  @override
  void run() {
    final iterable = Iterable.generate(1000, (i) => 'item$i');
    // Force evaluation to ensure fair comparison
    iterable.toList();
  }
}

// Lookup benchmarks - String
class ListStringLookupBenchmark extends BenchmarkBase {
  late List<String> list;
  
  ListStringLookupBenchmark() : super('List<String> lookup');
  
  @override
  void setup() {
    list = List.generate(1000, (i) => 'item$i');
  }
  
  @override
  void run() {
    for (int i = 0; i < 100; i++) {
      list.contains('item$i');
    }
  }
}

class SetStringLookupBenchmark extends BenchmarkBase {
  late Set<String> set;
  
  SetStringLookupBenchmark() : super('Set<String> lookup');
  
  @override
  void setup() {
    set = Set.from(List.generate(1000, (i) => 'item$i'));
  }
  
  @override
  void run() {
    for (int i = 0; i < 100; i++) {
      set.contains('item$i');
    }
  }
}

class IterableStringLookupBenchmark extends BenchmarkBase {
  late Iterable<String> iterable;
  
  IterableStringLookupBenchmark() : super('Iterable<String> lookup');
  
  @override
  void setup() {
    iterable = Iterable.generate(1000, (i) => 'item$i');
  }
  
  @override
  void run() {
    for (int i = 0; i < 100; i++) {
      iterable.contains('item$i');
    }
  }
}

// Creation benchmarks - CustomObject
class ListCustomObjectCreationBenchmark extends BenchmarkBase {
  ListCustomObjectCreationBenchmark() : super('List<CustomObject> creation');
  
  @override
  void run() {
    final list = <CustomObject>[];
    for (int i = 0; i < 1000; i++) {
      list.add(CustomObject(i, 'name$i'));
    }
  }
}

class SetCustomObjectCreationBenchmark extends BenchmarkBase {
  SetCustomObjectCreationBenchmark() : super('Set<CustomObject> creation');
  
  @override
  void run() {
    final set = <CustomObject>{};
    for (int i = 0; i < 1000; i++) {
      set.add(CustomObject(i, 'name$i'));
    }
  }
}

class IterableCustomObjectCreationBenchmark extends BenchmarkBase {
  IterableCustomObjectCreationBenchmark() : super('Iterable<CustomObject> creation');
  
  @override
  void run() {
    final iterable = Iterable.generate(1000, (i) => CustomObject(i, 'name$i'));
    // Force evaluation to ensure fair comparison
    iterable.toList();
  }
}

// Lookup benchmarks - CustomObject
class ListCustomObjectLookupBenchmark extends BenchmarkBase {
  late List<CustomObject> list;
  late List<CustomObject> searchObjects;
  
  ListCustomObjectLookupBenchmark() : super('List<CustomObject> lookup');
  
  @override
  void setup() {
    list = List.generate(1000, (i) => CustomObject(i, 'name$i'));
    searchObjects = List.generate(100, (i) => CustomObject(i, 'name$i'));
  }
  
  @override
  void run() {
    for (final obj in searchObjects) {
      list.contains(obj);
    }
  }
}

class SetCustomObjectLookupBenchmark extends BenchmarkBase {
  late Set<CustomObject> set;
  late List<CustomObject> searchObjects;
  
  SetCustomObjectLookupBenchmark() : super('Set<CustomObject> lookup');
  
  @override
  void setup() {
    set = Set.from(List.generate(1000, (i) => CustomObject(i, 'name$i')));
    searchObjects = List.generate(100, (i) => CustomObject(i, 'name$i'));
  }
  
  @override
  void run() {
    for (final obj in searchObjects) {
      set.contains(obj);
    }
  }
}

class IterableCustomObjectLookupBenchmark extends BenchmarkBase {
  late Iterable<CustomObject> iterable;
  late List<CustomObject> searchObjects;
  
  IterableCustomObjectLookupBenchmark() : super('Iterable<CustomObject> lookup');
  
  @override
  void setup() {
    iterable = Iterable.generate(1000, (i) => CustomObject(i, 'name$i'));
    searchObjects = List.generate(100, (i) => CustomObject(i, 'name$i'));
  }
  
  @override
  void run() {
    for (final obj in searchObjects) {
      iterable.contains(obj);
    }
  }
}

// Creation benchmarks - Map
class ListMapCreationBenchmark extends BenchmarkBase {
  ListMapCreationBenchmark() : super('List<Map> creation');
  
  @override
  void run() {
    final list = <Map<String, dynamic>>[];
    for (int i = 0; i < 1000; i++) {
      list.add({'id': i, 'name': 'name$i'});
    }
  }
}

class SetMapCreationBenchmark extends BenchmarkBase {
  SetMapCreationBenchmark() : super('Set<Map> creation');
  
  @override
  void run() {
    final set = <Map<String, dynamic>>{};
    for (int i = 0; i < 1000; i++) {
      set.add({'id': i, 'name': 'name$i'});
    }
  }
}

class IterableMapCreationBenchmark extends BenchmarkBase {
  IterableMapCreationBenchmark() : super('Iterable<Map> creation');
  
  @override
  void run() {
    final iterable = Iterable.generate(1000, (i) => {'id': i, 'name': 'name$i'});
    // Force evaluation to ensure fair comparison
    iterable.toList();
  }
}

void main() {
  print('Running collection type benchmarks...\n');
  
  print('=== INT BENCHMARKS ===');
  ListIntCreationBenchmark().report();
  SetIntCreationBenchmark().report();
  IterableIntCreationBenchmark().report();
  print('');
  ListIntLookupBenchmark().report();
  SetIntLookupBenchmark().report();
  IterableIntLookupBenchmark().report();
  print('');
  ListIntRemovalBenchmark().report();
  SetIntRemovalBenchmark().report();
  print('');
  
  print('=== STRING BENCHMARKS ===');
  ListStringCreationBenchmark().report();
  SetStringCreationBenchmark().report();
  IterableStringCreationBenchmark().report();
  print('');
  ListStringLookupBenchmark().report();
  SetStringLookupBenchmark().report();
  IterableStringLookupBenchmark().report();
  print('');
  
  print('=== CUSTOM OBJECT BENCHMARKS ===');
  ListCustomObjectCreationBenchmark().report();
  SetCustomObjectCreationBenchmark().report();
  IterableCustomObjectCreationBenchmark().report();
  print('');
  ListCustomObjectLookupBenchmark().report();
  SetCustomObjectLookupBenchmark().report();
  IterableCustomObjectLookupBenchmark().report();
  print('');
  
  print('=== MAP BENCHMARKS ===');
  ListMapCreationBenchmark().report();
  SetMapCreationBenchmark().report();
  IterableMapCreationBenchmark().report();
}
