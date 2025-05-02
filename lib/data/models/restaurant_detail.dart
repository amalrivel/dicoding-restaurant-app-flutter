import 'package:dicoding_restaurant_app/data/models/category.dart';
import 'package:dicoding_restaurant_app/data/models/customer_review.dart';
import 'package:dicoding_restaurant_app/data/models/menu.dart';

class RestaurantDetail {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menu menus;
  final num rating;
  final List<CustomerReview> customerReviews;

  RestaurantDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory RestaurantDetail.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "id": String id,
        "name": String name,
        "description": String description,
        "city": String city,
        "address": String address,
        "pictureId": String pictureId,
        "categories": List categoriesJson,
        "menus": Map<String, dynamic> menusJson,
        "rating": num rating,
        "customerReviews": List reviewsJson,
      } =>
        RestaurantDetail(
          id: id,
          name: name,
          description: description,
          city: city,
          address: address,
          pictureId: pictureId,
          categories:
              categoriesJson
                  .map((category) => Category.fromJson(category))
                  .toList(),
          menus: Menu.fromJson(menusJson),
          rating: rating,
          customerReviews:
              reviewsJson
                  .map((review) => CustomerReview.fromJson(review))
                  .toList(),
        ),
      _ => throw const FormatException('Failed to load restaurant detail.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "city": city,
      "address": address,
      "pictureId": pictureId,
      "categories": categories.map((category) => category.toJson()).toList(),
      "menus": menus.toJson(),
      "rating": rating,
      "customerReviews":
          customerReviews.map((review) => review.toJson()).toList(),
    };
  }
}

class RestaurantDetailResponse {
  final bool error;
  final String message;
  final RestaurantDetail restaurant;

  RestaurantDetailResponse({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        "error": bool error,
        "message": String message,
        "restaurant": Map<String, dynamic> restaurantJson,
      } =>
        RestaurantDetailResponse(
          error: error,
          message: message,
          restaurant: RestaurantDetail.fromJson(restaurantJson),
        ),
      _ =>
        throw const FormatException(
          'Failed to load restaurant detail response.',
        ),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      "error": error,
      "message": message,
      "restaurant": restaurant.toJson(),
    };
  }
}