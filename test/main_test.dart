import 'package:dicoding_restaurant_app/config/theme/app_theme.dart';
import 'package:dicoding_restaurant_app/main.dart';
import 'package:dicoding_restaurant_app/providers/states/theme_state.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  group('MyApp Widget', () {
    testWidgets('should apply theme based on ThemeProvider', (WidgetTester tester) async {
      // Create a fake ThemeProvider with light theme
      final lightThemeProvider = ThemeProvider();
      
      // Build the app with the fake provider
      await tester.pumpWidget(
        ChangeNotifierProvider<ThemeProvider>.value(
          value: lightThemeProvider,
          child: const MyApp(),
        ),
      );
      
      // Verify light theme is applied
      final materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialApp.theme, equals(AppTheme.lightTheme));
      expect(materialApp.themeMode, equals(ThemeMode.light));
      
      // Change to dark theme
      lightThemeProvider.setDarkTheme();
      await tester.pump();
      
      // Verify dark theme is applied
      final materialAppDark = tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(materialAppDark.themeMode, equals(ThemeMode.dark));
    });
  });

  group('HomePage Widget', () {
    testWidgets('should show current theme name', (WidgetTester tester) async {
      // Create a fake ThemeProvider
      final themeProvider = ThemeProvider();
      
      // Build the HomePage with the fake provider
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ThemeProvider>.value(
            value: themeProvider,
            child: const HomePage(title: 'Test App'),
          ),
        ),
      );
      
      // Check the current theme text is displayed
      expect(find.text('Current Theme: light'), findsOneWidget);
      
      // Change theme to dark
      themeProvider.setDarkTheme();
      await tester.pump();
      
      // Check the text is updated
      expect(find.text('Current Theme: dark'), findsOneWidget);
    });

    testWidgets('should have theme popup menu with options', (WidgetTester tester) async {
      // Create a fake ThemeProvider
      final themeProvider = ThemeProvider();
      
      // Build the HomePage with the fake provider
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<ThemeProvider>.value(
            value: themeProvider,
            child: const HomePage(title: 'Test App'),
          ),
        ),
      );
      
      // Tap the theme menu button
      await tester.tap(find.byIcon(Icons.brightness_6));
      await tester.pumpAndSettle();
      
      // Check all three theme options are present
      expect(find.text('Light Theme'), findsOneWidget);
      expect(find.text('Dark Theme'), findsOneWidget);
      expect(find.text('System Theme'), findsOneWidget);
      
      // Tap on Dark Theme option
      await tester.tap(find.text('Dark Theme'));
      await tester.pumpAndSettle();
      
      // Verify theme was updated
      expect(themeProvider.themeState, isA<DarkTheme>());
    });
  });
}