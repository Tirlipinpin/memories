import 'package:flutter/widgets.dart';
import 'package:memories/model/memory.dart';

class MemoriesRepository extends ChangeNotifier {
  final List<Memory> _memories = [];

  List<Memory> get memories => _memories;

  Future<void> fetchMemories() async {
    await Future.delayed(const Duration(seconds: 2));

    _memories.addAll([
      Memory(
        date: DateTime(2018, 09),
        place: "Neuilly-sur-Seine",
        title: "Embauche",
        id: "1",
      ),
      Memory(
        date: DateTime(2016, 06),
        place: "Sèvres",
        title: "Bac",
        id: "2",
      ),
      Memory(
        date: DateTime(2013, 06),
        place: "Ville d'Avray",
        title: "Brevet",
        id: "3",
      ),
      Memory(
        date: DateTime(2021, 05, 04),
        place: "Viroflay",
        title: "Couple",
        id: "4",
      ),
    ]);

    notifyListeners();
  }
}
