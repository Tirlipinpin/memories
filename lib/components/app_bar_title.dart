import 'package:flutter/material.dart';
import 'package:memories/components/user_pill.dart';
import 'package:memories/model/user.dart';
import 'package:memories/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return (Consumer<UserRepository>(
      builder: (context, userRepository, child) {
        final User? user = userRepository.getUser;

        if (user != null) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              UserPill(
                firstName: user.getFirstName,
                lastName: user.getLastName,
              )
            ],
          );
        }

        return const Text("");
      },
    ));
  }
}
