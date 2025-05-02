import 'package:dicoding_restaurant_app/data/models/menu_item.dart';

class Menu {
  final List<MenuItem> foods;
  final List<MenuItem> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {"foods": List foodsJson, "drinks": List drinksJson} => Menu(
        foods: foodsJson.map((food) => MenuItem.fromJson(food)).toList(),
        drinks: drinksJson.map((drink) => MenuItem.fromJson(drink)).toList(),
      ),
      _ => throw const FormatException('Failed to load menus.'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'foods': foods.map((food) => food.toJson()).toList(),
      'drinks': drinks.map((drink) => drink.toJson()).toList(),
    };
  }
}
