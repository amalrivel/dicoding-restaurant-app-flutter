import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'states/theme_state.dart';

class ThemeProvider extends ChangeNotifier {
  static const String THEME_KEY = 'theme_preference';

  // Default theme state
  ThemeState _themeState = const LightTheme();

  // Getter untuk current theme state
  ThemeState get themeState => _themeState;

  // Getter untuk compatibility dengan kode yang sudah ada
  bool get isDarkMode => _themeState.isDarkMode;

  ThemeProvider() {
    _loadThemePreference();
  }

  // Load theme preference from SharedPreferences
  Future<void> _loadThemePreference() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String themeName = prefs.getString(THEME_KEY) ?? 'light';

      // Convert string to ThemeState using factory constructor
      _themeState = ThemeState.fromName(themeName);
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading theme preference: $e');
    }
  }

  // Save theme preference to SharedPreferences
  Future<void> _saveThemePreference() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      // Save the theme name string
      await prefs.setString(THEME_KEY, _themeState.themeName);
    } catch (e) {
      debugPrint('Error saving theme preference: $e');
    }
  }

  // Toggle between light and dark theme
  void toggleTheme() {
    _themeState =
        _themeState is DarkTheme ? const LightTheme() : const DarkTheme();
    _saveThemePreference();
    notifyListeners();
  }

  // Set theme by theme state
  void setTheme(ThemeState newThemeState) {
    if (_themeState.runtimeType != newThemeState.runtimeType) {
      _themeState = newThemeState;
      _saveThemePreference();
      notifyListeners();
    }
  }

  // Set theme by name
  void setThemeByName(String themeName) {
    final newThemeState = ThemeState.fromName(themeName);
    setTheme(newThemeState);
  }

  // Methods for direct theme switching for better API
  void setLightTheme() => setTheme(const LightTheme());
  void setDarkTheme() => setTheme(const DarkTheme());
  void setSystemTheme() => setTheme(const SystemTheme());
}
