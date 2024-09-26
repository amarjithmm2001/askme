import 'package:askme/core/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Amar",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            accountEmail: Text("amar@gmail.com"),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const ListTile(
                  leading: Icon(Icons.account_box_outlined),
                  title: Text("Profile"),
                ),
                ListTile(
                  leading: const Icon(Icons.change_circle_outlined),
                  title: const Text("Mode"),
                  trailing: Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (bool value) {
                        themeProvider.toggleTheme();
                      },
                    ),
                  ),
                ),
                const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(),
                const SizedBox(
                  height: 10.0,
                ),
                const ListTile(
                  leading: Icon(Icons.notification_important_outlined),
                  title: Text("Privacy Policy"),
                ),
                const ListTile(
                  leading: Icon(Icons.masks_outlined),
                  title: Text("Contact us."),
                ),
                const ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("Log-Out"),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "APP DEVELOPED BY",
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "AMARJITH M M",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "amarjithmeethalemalayil@gmail.com",
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
