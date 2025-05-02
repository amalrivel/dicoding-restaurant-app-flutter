import 'package:dicoding_restaurant_app/config/theme/app_theme.dart';
import 'package:dicoding_restaurant_app/data/repositories/restaurant_repository.dart';
import 'package:dicoding_restaurant_app/data/services/api_service.dart';
import 'package:dicoding_restaurant_app/providers/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:dicoding_restaurant_app/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(
          create:
              (_) => RestaurantProvider(
                repository: RestaurantRepository(apiService: ApiService()),
              ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Dicoding Restaurant App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeState.themeMode,
          home: const HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          // Dropdown menu untuk memilih tema
          PopupMenuButton<String>(
            icon: const Icon(Icons.brightness_6),
            onSelected: (value) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Theme: ${themeProvider.themeState.themeName}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // ...
          ],
        ),
      ),
    );
  }
}
