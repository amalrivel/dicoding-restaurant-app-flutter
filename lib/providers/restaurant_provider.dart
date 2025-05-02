import 'package:dicoding_restaurant_app/providers/states/restaurant_state.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_restaurant_app/data/repositories/restaurant_repository.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  RestaurantState _state = const RestaurantLoadingState();

  RestaurantProvider({required this.repository}) {
    _fetchAllRestaurants();
  }

  RestaurantState get state => _state;

  Future<void> _fetchAllRestaurants() async {
    try {
      _state = const RestaurantLoadingState();
      notifyListeners();

      final restaurantList = await repository.getRestaurants();

      if (restaurantList.restaurants.isEmpty) {
        _state = const RestaurantNoneState('No Restaurant data found');
      } else {
        _state = RestaurantLoadedState(restaurantList);
      }
    } catch (e) {
      _state = RestaurantErrorState('Error: $e');
    }

    notifyListeners();
  }

  Future<void> refreshData() async {
    await _fetchAllRestaurants();
  }

  Future<void> searchRestaurants(String query) async {
    try {
      _state = const RestaurantLoadingState();
      notifyListeners();

      final restaurantList = await repository.searchRestaurants(query);

      if (restaurantList.restaurants.isEmpty) {
        _state = const RestaurantNoneState('No Restaurant found with that name');
      } else {
        _state = RestaurantLoadedState(restaurantList);
      }
    } catch (e) {
      _state = RestaurantErrorState('Error: $e');
    }

    notifyListeners();
  }
}