import 'dart:convert';
import 'package:dicoding_restaurant_app/config/constants/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:dicoding_restaurant_app/data/models/restaurant_list.dart';
import 'package:dicoding_restaurant_app/data/models/restaurant_detail.dart';
import 'package:dicoding_restaurant_app/data/models/customer_review.dart';

class ApiService {
  Future<RestaurantList> getRestaurants() async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.listEndpoint}'),
    );
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurants');
    }
  }

  Future<RestaurantDetailResponse> getRestaurantDetail(String id) async {
    final response = await http.get(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.detailEndpoint}/$id'),
    );
    if (response.statusCode == 200) {
      return RestaurantDetailResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }

  Future<RestaurantList> searchRestaurants(String query) async {
    final response = await http.get(
      Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.searchEndpoint}?${ApiConstants.searchQueryParam}=$query',
      ),
    );
    if (response.statusCode == 200) {
      return RestaurantList.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to search restaurants');
    }
  }

  Future<CustomerReviewResponse> addReview(
    String id,
    String name,
    String review,
  ) async {
    final response = await http.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.reviewEndpoint}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        ApiConstants.idKey: id,
        ApiConstants.nameKey: name,
        ApiConstants.reviewKey: review,
      }),
    );

    if (response.statusCode == 200) {
      return CustomerReviewResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to add review');
    }
  }
}
