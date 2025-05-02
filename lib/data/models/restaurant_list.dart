import 'package:dicoding_restaurant_app/data/models/restaurant.dart';

class RestaurantList {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;

  RestaurantList({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantList.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "error": bool error,
        "message": String message,
        "count": int count,
        "restaurants": List restaurantJson,
      } =>
        RestaurantList(
          error: error,
          message: message,
          count: count,
          restaurants:
              restaurantJson
                  .map((restaurant) => Restaurant.fromJson(restaurant))
                  .toList(),
        ),
      _ => throw const FormatException('Failed to load restaurant response.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
      "count": count,
      "restaurants": restaurants.map((restaurant) => restaurant.toJson()).toList(),
    };
  }
}
