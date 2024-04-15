import 'package:flutter/material.dart';
import 'package:sushi/components/my_drawer_tile.dart';
import 'package:sushi/pages/settings_page.dart';
import 'package:sushi/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  void logout(BuildContext context) {
    final authService = AuthService();
    authService.signOut();
    Navigator.pop(context); // Close the drawer after logout
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: 'HOME',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: 'SETTINGS',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: 'LOGOUT',
            icon: Icons.logout,
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }
}
