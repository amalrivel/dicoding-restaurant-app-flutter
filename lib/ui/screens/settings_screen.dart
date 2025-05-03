import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_restaurant_app/config/constants/app_constants.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return ListView(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          children: [
            const ListTile(
              title: Text('Appearance'),
              leading: Icon(Icons.palette),
              contentPadding: EdgeInsets.all(0),
            ),
            RadioListTile<String>(
              title: const Text('Light Theme'),
              value: 'light',
              groupValue: themeProvider.themeState.themeName,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setThemeByName(value);
                }
              },
            ),
            RadioListTile<String>(
              title: const Text('Dark Theme'),
              value: 'dark',
              groupValue: themeProvider.themeState.themeName,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setThemeByName(value);
                }
              },
            ),
            RadioListTile<String>(
              title: const Text('System Theme'),
              value: 'system',
              groupValue: themeProvider.themeState.themeName,
              onChanged: (value) {
                if (value != null) {
                  themeProvider.setThemeByName(value);
                }
              },
            ),
            const Divider(),
            const ListTile(
              title: Text('About'),
              leading: Icon(Icons.info),
              contentPadding: EdgeInsets.all(0),
            ),
            ListTile(
              title: const Text('Version'),
              subtitle: Text(AppConstants.appVersion),
              leading: const Icon(Icons.tag),
            ),
          ],
        );
      },
    );
  }
}