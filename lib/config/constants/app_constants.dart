class AppConstants {
  // App Info
  static const String appName = 'Dicoding Restaurant App';
  static const String appVersion = '1.0.0';
  
  // Layout constants
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 12.0;
  static const double imageHeight = 160.0;
  
  // Restaurant details
  static const int descriptionMaxLines = 2;
  static const double ratingIconSize = 14.0;
  static const double locationIconSize = 14.0;
  
  // Navigation
  static const int initialTabIndex = 0;
  
  // Error messages
  static const String errorLoadingRestaurants = 'Failed to load restaurants';
  static const String noRestaurantsFound = 'No restaurants found';
  static const String networkErrorMessage = 'Check your connection and try again';
  
  // Search related
  static const String searchHintText = 'Search restaurants...';
  static const Duration searchDebounceTime = Duration(milliseconds: 500);
}