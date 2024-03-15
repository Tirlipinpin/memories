import 'package:flutter/widgets.dart';
import 'package:memories/model/user.dart';

class UserRepository extends ChangeNotifier {
  User? _user;

  User? get getUser => _user;

  set setUser(User? user) => _user = user;

  Future<void> fetch() async {
    await Future.delayed(const Duration(seconds: 2));

    _user = (User("Jean", "Jeannot", "123fezf"));
    notifyListeners();
  }
}
