class ApiConstants {
  // Base URL
  static const String baseUrl = 'https://restaurant-api.dicoding.dev';
  
  // Endpoints
  static const String listEndpoint = '/list';
  static const String detailEndpoint = '/detail'; // Akan diikuti dengan /{id}
  static const String searchEndpoint = '/search'; // Akan diikuti dengan ?q={query}
  static const String reviewEndpoint = '/review';
  
  // Image URLs
  static const String imageBaseUrl = 'https://restaurant-api.dicoding.dev/images';
  static const String smallImageUrl = '$imageBaseUrl/small';
  static const String mediumImageUrl = '$imageBaseUrl/medium';
  static const String largeImageUrl = '$imageBaseUrl/large';
  
  // Parameter keys
  static const String searchQueryParam = 'q';
  
  // Request body keys
  static const String idKey = 'id';
  static const String nameKey = 'name';
  static const String reviewKey = 'review';
  
  // Response keys (opsional, tergantung apakah Anda ingin menghindari string literals dalam parsing)
  static const String errorKey = 'error';
  static const String messageKey = 'message';
  static const String countKey = 'count';
  static const String restaurantsKey = 'restaurants';
  static const String restaurantKey = 'restaurant';
}