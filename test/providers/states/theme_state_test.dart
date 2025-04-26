import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dicoding_restaurant_app/providers/states/theme_state.dart';

void main() {
  group('ThemeState', () {
    test('LightTheme should have correct properties', () {
      const lightTheme = LightTheme();
      
      expect(lightTheme.themeMode, equals(ThemeMode.light));
      expect(lightTheme.isDarkMode, equals(false));
      expect(lightTheme.themeName, equals('light'));
    });

    test('DarkTheme should have correct properties', () {
      const darkTheme = DarkTheme();
      
      expect(darkTheme.themeMode, equals(ThemeMode.dark));
      expect(darkTheme.isDarkMode, equals(true));
      expect(darkTheme.themeName, equals('dark'));
    });

    test('SystemTheme should have correct properties', () {
      const systemTheme = SystemTheme();
      
      expect(systemTheme.themeMode, equals(ThemeMode.system));
      expect(systemTheme.isDarkMode, equals(false));
      expect(systemTheme.themeName, equals('system'));
    });

    group('ThemeState.fromName', () {
      test('should return LightTheme for "light"', () {
        final theme = ThemeState.fromName('light');
        expect(theme, isA<LightTheme>());
      });

      test('should return DarkTheme for "dark"', () {
        final theme = ThemeState.fromName('dark');
        expect(theme, isA<DarkTheme>());
      });

      test('should return SystemTheme for "system"', () {
        final theme = ThemeState.fromName('system');
        expect(theme, isA<SystemTheme>());
      });

      test('should return default LightTheme for unknown name', () {
        final theme = ThemeState.fromName('unknown');
        expect(theme, isA<LightTheme>());
      });

      test('should return default LightTheme for empty string', () {
        final theme = ThemeState.fromName('');
        expect(theme, isA<LightTheme>());
      });
    });
  });
}