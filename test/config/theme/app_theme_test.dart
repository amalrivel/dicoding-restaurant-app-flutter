import 'package:dicoding_restaurant_app/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTheme', () {
    test('lightTheme should have correct properties', () {
      final lightTheme = AppTheme.lightTheme;
      
      // Test basic theme attributes
      expect(lightTheme.brightness, equals(Brightness.light));
      expect(lightTheme.useMaterial3, isTrue);
      
      // Test color scheme
      expect(lightTheme.colorScheme.primary, isNotNull);
      expect(lightTheme.colorScheme.secondary, isNotNull);
      expect(lightTheme.colorScheme.surface, isNotNull);
      
      // Test app bar theme
      expect(lightTheme.appBarTheme, isNotNull);
      expect(lightTheme.appBarTheme.centerTitle, isTrue);
      
      // Test card theme
      expect(lightTheme.cardTheme, isNotNull);
      expect(lightTheme.cardTheme.elevation, greaterThan(0));
      
      // Test button themes
      expect(lightTheme.elevatedButtonTheme, isNotNull);
      expect(lightTheme.textButtonTheme, isNotNull);
    });

    test('darkTheme should have correct properties', () {
      final darkTheme = AppTheme.darkTheme;
      
      // Test basic theme attributes
      expect(darkTheme.brightness, equals(Brightness.dark));
      expect(darkTheme.useMaterial3, isTrue);
      
      // Test color scheme
      expect(darkTheme.colorScheme.primary, isNotNull);
      expect(darkTheme.colorScheme.secondary, isNotNull);
      expect(darkTheme.colorScheme.surface, isNotNull);
      
      // Test app bar theme
      expect(darkTheme.appBarTheme, isNotNull);
      
      // Test card theme
      expect(darkTheme.cardTheme, isNotNull);
      
      // Test button themes
      expect(darkTheme.elevatedButtonTheme, isNotNull);
      expect(darkTheme.textButtonTheme, isNotNull);
    });

    test('light and dark themes should be different', () {
      final lightTheme = AppTheme.lightTheme;
      final darkTheme = AppTheme.darkTheme;
      
      expect(lightTheme.brightness, isNot(equals(darkTheme.brightness)));
      expect(lightTheme.scaffoldBackgroundColor, isNot(equals(darkTheme.scaffoldBackgroundColor)));
      expect(lightTheme.colorScheme.primary, isNot(equals(darkTheme.colorScheme.primary)));
      expect(lightTheme.textTheme.bodyLarge?.color, isNot(equals(darkTheme.textTheme.bodyLarge?.color)));
    });
  });
}