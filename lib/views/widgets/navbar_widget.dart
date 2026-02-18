import 'package:flutter/material.dart';
import 'package:inventory/data/notifiers.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPageNotifier,
      builder: (context, selectedPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.inventory),
              label: 'Barang',
            ),
            NavigationDestination(
              icon: Icon(Icons.swap_horiz),
              label: 'Aktivitas',
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: (value) {
            selectedPageNotifier.value = value;
          },
          selectedIndex: selectedPage,
        );
      },
    );
  }
}
