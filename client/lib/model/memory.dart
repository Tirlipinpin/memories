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
}
