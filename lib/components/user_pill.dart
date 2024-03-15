import 'package:flutter/material.dart';

class UserPill extends StatelessWidget {
  final String _firstName;
  final String _lastName;

  const UserPill({
    super.key,
    required firstName,
    required lastName,
  })  : _firstName = firstName,
        _lastName = lastName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blueAccent.shade200,
      child: Text(
          "${_firstName.substring(0, 1).toUpperCase()}${_lastName.substring(0, 1).toUpperCase()}"),
    );
  }
}
