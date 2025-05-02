import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:dicoding_restaurant_app/ui/widgets/restaurant/restaurant_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigate to search screen
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.brightness_6),
            onSelected: (value) {
              final themeProvider = Provider.of<ThemeProvider>(
                context,
                listen: false,
              );
              themeProvider.setThemeByName(value);
            },
            itemBuilder:
                (context) => [
                  const PopupMenuItem(
                    value: 'light',
                    child: Text('Light Theme'),
                  ),
                  const PopupMenuItem(value: 'dark', child: Text('Dark Theme')),
                  const PopupMenuItem(
                    value: 'system',
                    child: Text('System Theme'),
                  ),
                ],
          ),
        ],
      ),
      body: const RestaurantListWidget(),
    );
  }
}
