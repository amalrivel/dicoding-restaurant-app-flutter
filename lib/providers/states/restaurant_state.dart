import 'package:dicoding_restaurant_app/data/models/restaurant_list.dart';

sealed class RestaurantState {
  const RestaurantState();
}

class RestaurantLoadingState extends RestaurantState {
  const RestaurantLoadingState();
}

class RestaurantNoneState extends RestaurantState {
  final String message;

  const RestaurantNoneState(this.message);
}

class RestaurantErrorState extends RestaurantState {
  final String error;

  const RestaurantErrorState(this.error);
}

class RestaurantLoadedState extends RestaurantState {
  final RestaurantList data;

  RestaurantLoadedState(this.data);
}
