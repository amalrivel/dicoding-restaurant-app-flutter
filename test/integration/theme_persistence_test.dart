import 'package:dicoding_restaurant_app/providers/states/theme_state.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Theme Persistence Integration Test', () {
    test('should save and load theme preference correctly', () async {
      // Setup shared preferences initial value
      SharedPreferences.setMockInitialValues({});
      
      // Create first provider instance and change theme
      final firstProvider = ThemeProvider();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow load to complete
      
      // Default should be light theme
      expect(firstProvider.themeState, isA<LightTheme>());
      
      // Change to dark theme which should trigger a save
      firstProvider.setDarkTheme();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow save to complete
      
      // Create new provider instance that should load the saved preference
      final secondProvider = ThemeProvider();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow load to complete
      
      // Verify the second provider loaded the dark theme
      expect(secondProvider.themeState, isA<DarkTheme>());
    });
    
    test('should handle system theme persistence correctly', () async {
      // Setup shared preferences for test
      SharedPreferences.setMockInitialValues({});
      
      // Set system theme and verify persistence
      final provider1 = ThemeProvider();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow load to complete
      provider1.setSystemTheme();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow save to complete
      
      // Create new provider and verify it loads the system theme
      final provider2 = ThemeProvider();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow load to complete
      expect(provider2.themeState, isA<SystemTheme>());
    });
    
    test('should handle invalid theme name gracefully', () async {
      // Setup shared preferences with invalid theme name
      SharedPreferences.setMockInitialValues({
        ThemeProvider.THEME_KEY: 'invalid_theme'
      });
      
      // Create provider that should load from preferences but default to light
      final provider = ThemeProvider();
      await Future.delayed(const Duration(milliseconds: 50)); // Allow load to complete
      
      // Verify default light theme was used
      expect(provider.themeState, isA<LightTheme>());
    });
  });
}