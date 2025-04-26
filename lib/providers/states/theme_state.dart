import 'package:flutter/material.dart';

/// Sealed class yang merepresentasikan state tema aplikasi
sealed class ThemeState {
  /// Mengembalikan mode tema yang sesuai untuk Flutter
  ThemeMode get themeMode;

  /// Mengembalikan nilai boolean yang menunjukkan apakah tema saat ini adalah dark mode
  bool get isDarkMode;

  /// Mengembalikan nama tema untuk disimpan di SharedPreferences
  String get themeName;

  /// Factory constructor untuk membuat ThemeState dari string nama tema
  factory ThemeState.fromName(String name) {
    return switch (name) {
      'dark' => const DarkTheme(),
      'system' => const SystemTheme(),
      _ => const LightTheme(),
    };
  }

  /// Protected constructor for subclasses
  const ThemeState();
}

/// Merepresentasikan tema light (terang)
class LightTheme extends ThemeState {
  const LightTheme();

  @override
  ThemeMode get themeMode => ThemeMode.light;

  @override
  bool get isDarkMode => false;

  @override
  String get themeName => 'light';
}

/// Merepresentasikan tema dark (gelap)
class DarkTheme extends ThemeState {
  const DarkTheme();

  @override
  ThemeMode get themeMode => ThemeMode.dark;

  @override
  bool get isDarkMode => true;

  @override
  String get themeName => 'dark';
}

/// Merepresentasikan tema yang mengikuti pengaturan sistem
class SystemTheme extends ThemeState {
  const SystemTheme();

  @override
  ThemeMode get themeMode => ThemeMode.system;

  @override
  bool get isDarkMode => false; // Nilai default, idealnya akan menyesuaikan dengan sistem

  @override
  String get themeName => 'system';
}
