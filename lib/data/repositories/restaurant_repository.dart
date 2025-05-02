import 'package:dicoding_restaurant_app/data/models/restaurant_list.dart';
import 'package:dicoding_restaurant_app/data/models/restaurant_detail.dart';
import 'package:dicoding_restaurant_app/data/models/customer_review.dart';
import 'package:dicoding_restaurant_app/data/services/api_service.dart';

class RestaurantRepository {
  final ApiService apiService;
  
  RestaurantRepository({required this.apiService});
  
  Future<RestaurantList> getRestaurants() {
    return apiService.getRestaurants();
  }
  
  Future<RestaurantDetailResponse> getRestaurantDetail(String id) {
    return apiService.getRestaurantDetail(id);
  }
  
  Future<RestaurantList> searchRestaurants(String query) {
    return apiService.searchRestaurants(query);
  }
  
  Future<CustomerReviewResponse> addReview(String id, String name, String review) {
    return apiService.addReview(id, name, review);
  }
}