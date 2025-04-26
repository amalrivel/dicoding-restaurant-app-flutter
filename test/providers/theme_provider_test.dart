import 'package:dicoding_restaurant_app/providers/states/theme_state.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('ThemeProvider', () {
    late ThemeProvider themeProvider;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      themeProvider = ThemeProvider();
    });

    test('should initialize with LightTheme by default', () {
      expect(themeProvider.themeState, isA<LightTheme>());
      expect(themeProvider.isDarkMode, false);
    });

    test('toggleTheme should switch between light and dark themes', () {
      // Initially LightTheme
      expect(themeProvider.themeState, isA<LightTheme>());
      
      // Toggle to DarkTheme
      themeProvider.toggleTheme();
      expect(themeProvider.themeState, isA<DarkTheme>());
      expect(themeProvider.isDarkMode, true);
      
      // Toggle back to LightTheme
      themeProvider.toggleTheme();
      expect(themeProvider.themeState, isA<LightTheme>());
      expect(themeProvider.isDarkMode, false);
    });

    test('setTheme should update theme state', () {
      // Start with LightTheme
      expect(themeProvider.themeState, isA<LightTheme>());
      
      // Change to DarkTheme
      themeProvider.setTheme(const DarkTheme());
      expect(themeProvider.themeState, isA<DarkTheme>());
      
      // Change to SystemTheme
      themeProvider.setTheme(const SystemTheme());
      expect(themeProvider.themeState, isA<SystemTheme>());
    });

    test('setTheme should not update if same type', () {
      // Start with LightTheme
      expect(themeProvider.themeState, isA<LightTheme>());
      final initialState = themeProvider.themeState;
      
      // Try to set same type
      themeProvider.setTheme(const LightTheme());
      
      // Should be same instance, or at least same type
      expect(themeProvider.themeState.runtimeType, equals(initialState.runtimeType));
      
      // Change theme first to DarkTheme
      themeProvider.setTheme(const DarkTheme());
      expect(themeProvider.themeState, isA<DarkTheme>());
      
      // Store this state
      final darkState = themeProvider.themeState;
      
      // Try to set same type again
      themeProvider.setTheme(const DarkTheme());
      
      // Should still be DarkTheme and same instance or at least same type
      expect(themeProvider.themeState.runtimeType, equals(darkState.runtimeType));
    });

    test('setThemeByName should set correct theme', () {
      // Set to dark theme by name
      themeProvider.setThemeByName('dark');
      expect(themeProvider.themeState, isA<DarkTheme>());
      
      // Set to system theme by name
      themeProvider.setThemeByName('system');
      expect(themeProvider.themeState, isA<SystemTheme>());
      
      // Set to light theme by name
      themeProvider.setThemeByName('light');
      expect(themeProvider.themeState, isA<LightTheme>());
      
      // Set to unknown name should default to light
      themeProvider.setThemeByName('invalid');
      expect(themeProvider.themeState, isA<LightTheme>());
    });

    test('convenience methods should set correct themes', () {
      // Test setDarkTheme
      themeProvider.setDarkTheme();
      expect(themeProvider.themeState, isA<DarkTheme>());
      
      // Test setSystemTheme
      themeProvider.setSystemTheme();
      expect(themeProvider.themeState, isA<SystemTheme>());
      
      // Test setLightTheme
      themeProvider.setLightTheme();
      expect(themeProvider.themeState, isA<LightTheme>());
    });
  });
}