import 'package:dicoding_restaurant_app/config/constants/app_constants.dart';
import 'package:dicoding_restaurant_app/config/theme/app_theme.dart';
import 'package:dicoding_restaurant_app/data/repositories/restaurant_repository.dart';
import 'package:dicoding_restaurant_app/data/services/api_service.dart';
import 'package:dicoding_restaurant_app/providers/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:dicoding_restaurant_app/ui/screens/main_screen.dart';
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
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeState.themeMode,
          home: const MainScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}