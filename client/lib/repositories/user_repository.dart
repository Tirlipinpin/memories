import 'package:flutter/widgets.dart';
import 'package:memories/model/user.dart';
import 'package:http/http.dart' as http;

class UserRepository extends ChangeNotifier {
  User? _user;

  final http.BaseClient _httpClient;

  User? get getUser => _user;

  set setUser(User? user) => _user = user;

  UserRepository({required http.BaseClient httpClient})
      : _httpClient = httpClient;

  Future<void> fetch() async {
    await Future.delayed(const Duration(seconds: 1));

    await _httpClient.get(Uri.parse("/user"));

    _user = (User("Jean", "Jeannot", "123fezf"));
    notifyListeners();
  }
}
