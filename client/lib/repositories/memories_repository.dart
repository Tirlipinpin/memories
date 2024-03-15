import 'package:flutter/widgets.dart';
import 'package:memories/model/memory.dart';
import 'package:http/http.dart' as http;

class MemoriesRepository extends ChangeNotifier {
  final List<Memory> _memories = [];
  final http.BaseClient _httpClient;

  List<Memory> get memories => _memories;

  MemoriesRepository({required final http.BaseClient httpClient})
      : _httpClient = httpClient;

  Future<void> fetchMemories() async {
    await Future.delayed(const Duration(seconds: 0));

    await _httpClient.get(Uri.parse("/memories"));

    _memories.addAll([
      Memory(
        date: DateTime(2018, 09),
        place: "Namek",
        title: "Saiyan awakening",
        id: "1",
      ),
      Memory(
        date: DateTime(2016, 06),
        place: "Tatooine",
        title: "Birth",
        id: "2",
      ),
      Memory(
        date: DateTime(2013, 06),
        place: "Gotham City",
        title: "Fighting Evil",
        id: "3",
      ),
      Memory(
        date: DateTime(2021, 05, 04),
        place: "Jade Palace",
        title: "Became The Great Sage, Heaven's Equal",
        id: "4",
      ),
    ]);

    notifyListeners();
  }

  Future<void> selectMemory(String memory) async {
    await Future.delayed(const Duration(seconds: 0));

    // do some async stuff

    notifyListeners();
  }
}
