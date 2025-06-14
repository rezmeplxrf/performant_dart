// ignore_for_file: unused_local_variable

import 'dart:collection';
import 'dart:convert';
import 'dart:math';
import 'package:benchmark_harness/benchmark_harness.dart';

// Simulated API response data
Map<String, dynamic> createTestData(int size) {
  final random = Random(42); // Fixed seed for consistency
  final data = <String, dynamic>{};

  for (int i = 0; i < size; i++) {
    data['key_$i'] = {
      'id': i,
      'name': 'Item $i',
      'value': random.nextDouble() * 100,
      'active': random.nextBool(),
      'tags': ['tag${i % 5}', 'category${i % 3}'],
      'metadata': {
        'created':
            DateTime.now().millisecondsSinceEpoch - random.nextInt(1000000),
        'priority': random.nextInt(10),
      },
    };
  }
  return data;
}

class JsonParseAndMapTraversalBenchmark extends BenchmarkBase {
  late String jsonString;
  late List<String> testKeys;

  JsonParseAndMapTraversalBenchmark() : super('JSON Parse + Map Traversal');

  @override
  void setup() {
    final testData = createTestData(1000);
    jsonString = jsonEncode(testData);
    testKeys = testData.keys.take(100).toList();
  }

  @override
  void run() {
    // Parse JSON (this creates a Map<String, dynamic> internally)
    final Map<String, dynamic> data = jsonDecode(jsonString);

    // Key lookup operations
    for (int i = 0; i < 100; i++) {
      final key = testKeys[i % testKeys.length];
      final item = data[key];
      if (item != null) {
        // Access nested properties
        final id = item['id'];
        final name = item['name'];
        final metadata = item['metadata'];
        if (metadata != null) {
          final priority = metadata['priority'];
        }
      }
    }

    // Iteration operations
    int count = 0;
    for (final entry in data.entries) {
      if (entry.value['active'] == true) {
        count++;
      }
      if (count > 50) break;
    }

    // Contains key operations
    for (int i = 0; i < 50; i++) {
      data.containsKey('key_${i * 2}');
    }
  }
}

class JsonParseConvertHashMapTraversalBenchmark extends BenchmarkBase {
  late String jsonString;
  late List<String> testKeys;

  JsonParseConvertHashMapTraversalBenchmark()
    : super('JSON Parse + Convert to HashMap + Traversal');

  @override
  void setup() {
    final testData = createTestData(1000);
    jsonString = jsonEncode(testData);
    testKeys = testData.keys.take(100).toList();
  }

  @override
  void run() {
    // Parse JSON
    final Map<String, dynamic> parsedData = jsonDecode(jsonString);

    // Convert to HashMap
    final HashMap<String, dynamic> data = HashMap<String, dynamic>.from(
      parsedData,
    );

    // Key lookup operations
    for (int i = 0; i < 100; i++) {
      final key = testKeys[i % testKeys.length];
      final item = data[key];
      if (item != null) {
        // Access nested properties
        final id = item['id'];
        final name = item['name'];
        final metadata = item['metadata'];
        if (metadata != null) {
          final priority = metadata['priority'];
        }
      }
    }

    // Iteration operations
    int count = 0;
    for (final entry in data.entries) {
      if (entry.value['active'] == true) {
        count++;
      }
      if (count > 50) break;
    }

    // Contains key operations
    for (int i = 0; i < 50; i++) {
      data.containsKey('key_${i * 2}');
    }
  }
}

class JsonParseOnlyBenchmark extends BenchmarkBase {
  late String jsonString;

  JsonParseOnlyBenchmark() : super('JSON Parse Only');

  @override
  void setup() {
    final testData = createTestData(1000);
    jsonString = jsonEncode(testData);
  }

  @override
  void run() {
    final Map<String, dynamic> data = jsonDecode(jsonString);
  }
}

class HashMapConversionOnlyBenchmark extends BenchmarkBase {
  late Map<String, dynamic> parsedData;

  HashMapConversionOnlyBenchmark() : super('HashMap Conversion Only');

  @override
  void setup() {
    final testData = createTestData(1000);
    final jsonString = jsonEncode(testData);
    parsedData = jsonDecode(jsonString);
  }

  @override
  void run() {
    final hashMap = HashMap<String, dynamic>.from(parsedData);
  }
}

class TraversalOnlyMapBenchmark extends BenchmarkBase {
  late Map<String, dynamic> data;
  late List<String> testKeys;

  TraversalOnlyMapBenchmark() : super('Traversal Only - Parsed Map');

  @override
  void setup() {
    final testData = createTestData(1000);
    final jsonString = jsonEncode(testData);
    data = jsonDecode(jsonString);
    testKeys = data.keys.take(100).toList();
  }

  @override
  void run() {
    // Key lookup operations
    for (int i = 0; i < 100; i++) {
      final key = testKeys[i % testKeys.length];
      final item = data[key];
      if (item != null) {
        final id = item['id'];
        final name = item['name'];
        final metadata = item['metadata'];
        if (metadata != null) {
          final priority = metadata['priority'];
        }
      }
    }

    // Iteration operations
    int count = 0;
    for (final entry in data.entries) {
      if (entry.value['active'] == true) {
        count++;
      }
      if (count > 50) break;
    }

    // Contains key operations
    for (int i = 0; i < 50; i++) {
      data.containsKey('key_${i * 2}');
    }
  }
}

class TraversalOnlyHashMapBenchmark extends BenchmarkBase {
  late HashMap<String, dynamic> data;
  late List<String> testKeys;

  TraversalOnlyHashMapBenchmark() : super('Traversal Only - HashMap');

  @override
  void setup() {
    final testData = createTestData(1000);
    final jsonString = jsonEncode(testData);
    final parsedData = jsonDecode(jsonString);
    data = HashMap<String, dynamic>.from(parsedData);
    testKeys = data.keys.take(100).toList();
  }

  @override
  void run() {
    // Key lookup operations
    for (int i = 0; i < 100; i++) {
      final key = testKeys[i % testKeys.length];
      final item = data[key];
      if (item != null) {
        final id = item['id'];
        final name = item['name'];
        final metadata = item['metadata'];
        if (metadata != null) {
          final priority = metadata['priority'];
        }
      }
    }

    // Iteration operations
    int count = 0;
    for (final entry in data.entries) {
      if (entry.value['active'] == true) {
        count++;
      }
      if (count > 50) break;
    }

    // Contains key operations
    for (int i = 0; i < 50; i++) {
      data.containsKey('key_${i * 2}');
    }
  }
}

void main() {
  print('Benchmarking JSON API Response Processing: Map vs HashMap\n');
  print(
    'Testing realistic API workflow: JSON parse → traverse vs JSON parse → convert → traverse\n',
  );

  // Full workflow benchmarks
  print('=== Full Workflow Comparison ===');
  JsonParseAndMapTraversalBenchmark().report();
  JsonParseConvertHashMapTraversalBenchmark().report();

  print('\n=== Individual Operation Costs ===');
  JsonParseOnlyBenchmark().report();
  HashMapConversionOnlyBenchmark().report();

  print('\n=== Traversal Performance Comparison ===');
  TraversalOnlyMapBenchmark().report();
  TraversalOnlyHashMapBenchmark().report();

  print('\n=== Analysis Guide ===');
  print(
    '• Compare "JSON Parse + Map Traversal" vs "JSON Parse + Convert to HashMap + Traversal"',
  );
  print(
    '• If conversion overhead > traversal performance gain, stick with Map',
  );
  print(
    '• Consider your actual usage pattern: one-time vs repeated traversals',
  );
  print('• Lower microseconds = better performance');
}
