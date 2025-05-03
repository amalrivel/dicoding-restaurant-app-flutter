import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_restaurant_app/providers/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/config/constants/app_constants.dart';
import 'package:dicoding_restaurant_app/ui/widgets/restaurant/restaurant_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search restaurants...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  AppConstants.cardBorderRadius,
                ),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  Provider.of<RestaurantProvider>(context, listen: false)
                    .refreshData(); // Reset to all restaurants
                },
              ),
            ),
            onChanged: (value) {
              if (value.length > 2) {
                Provider.of<RestaurantProvider>(context, listen: false)
                  .searchRestaurants(value);
              }
            },
          ),
        ),
        const Expanded(
          child: RestaurantListWidget(),
        ),
      ],
    );
  }
}