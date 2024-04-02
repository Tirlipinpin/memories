import 'package:flutter/material.dart';
import 'package:memories/repositories/user_repository.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserRepository>(
      builder: (context, value, _) {
        final user = value.getUser;

        if (user == null) {
          return const Text("No user created");
        }

        double screenWidth = MediaQuery.of(context).size.width;

        return Form(
          child: SizedBox(
            width: 0.7 * screenWidth,
            child: Column(
              children: [
                Title(
                  color: Colors.black,
                  child: const Text(
                    "Set your preferences",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  initialValue: user.getFirstName,
                  decoration: const InputDecoration(
                      labelText: "Firstname", border: OutlineInputBorder()),
                  readOnly: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  initialValue: user.getLastName,
                  decoration: const InputDecoration(
                      labelText: "Lastname", border: OutlineInputBorder()),
                  readOnly: true,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
