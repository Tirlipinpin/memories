import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  final void Function(int?) _handleDestinationSelected;
  final int _selectedIndex;

  const Navigation({
    super.key,
    required onDestinationSelected,
    required int selectedIndex,
  })  : _handleDestinationSelected = onDestinationSelected,
        _selectedIndex = selectedIndex;

  @override
  Widget build(BuildContext context) {
    return (NavigationBar(
      onDestinationSelected: _handleDestinationSelected,
      selectedIndex: _selectedIndex,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.memory),
          label: "Memory",
        ),
        NavigationDestination(
          icon: Icon(Icons.person),
          label: "Profile",
        ),
      ],
    ));
  }
}
