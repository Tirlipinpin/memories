import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:memories/model/memory.dart';
import 'package:http/http.dart' as http;

class MemoriesRepository extends ChangeNotifier {
  final List<Memory> _memories = [];
  final http.BaseClient? _httpClient;

  List<Memory> get memories => _memories;

  MemoriesRepository({final http.BaseClient? httpClient})
      : _httpClient = httpClient;

  Future<void> fetchMemories() async {
    if (_httpClient == null) {
      return;
    }

    await Future.delayed(const Duration(seconds: 2));

    final response = await _httpClient.get(Uri.parse("/memories"));

    if (response.statusCode == 200) {
      final List<Memory> list = [];
      final data = jsonDecode(response.body);

      for (Map<String, dynamic> memory in data) {
        list.add(Memory.fromJson(memory));
      }

      _memories.addAll(list);

      notifyListeners();
    } else {
      throw Exception("Failed to load memory");
    }
  }

  Future<void> selectMemory(String memory) async {
    await Future.delayed(const Duration(seconds: 0));

    // do some async stuff

    notifyListeners();
  }
}
