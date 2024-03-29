class Memory {
  final DateTime _date;
  final String _place;
  final String _title;
  final String _id;

  get date => _date;

  get place => _place;

  get title => _title;

  get id => _id;

  Memory({
    required DateTime date,
    required String place,
    required String title,
    required String id,
  })  : _date = date,
        _title = title,
        _place = place,
        _id = id;

  factory Memory.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'date': String date,
        'place': String place,
        'title': String title,
        'id': String id,
      } =>
        Memory(date: DateTime.parse(date), place: place, title: title, id: id),
      _ => throw const FormatException("Failed to load memory")
    };
  }
}
