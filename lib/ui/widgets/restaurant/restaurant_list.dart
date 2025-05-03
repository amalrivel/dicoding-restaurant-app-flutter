import 'package:dicoding_restaurant_app/config/constants/app_constants.dart';
import 'package:dicoding_restaurant_app/providers/states/restaurant_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_restaurant_app/providers/restaurant_provider.dart';
import 'package:dicoding_restaurant_app/ui/widgets/restaurant/restaurant_card.dart';
import 'package:dicoding_restaurant_app/ui/widgets/common/error_widget.dart';
import 'package:dicoding_restaurant_app/ui/widgets/common/loading_widget.dart';

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>(
      builder: (context, provider, _) {
        final state = provider.state;

        return switch (state) {
          RestaurantLoadingState() => const LoadingWidget(),

          RestaurantLoadedState(data: final restaurantList) => ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: AppConstants.defaultPadding / 2),
            itemCount: restaurantList.restaurants.length,
            itemBuilder: (context, index) {
              return RestaurantCardWidget(
                restaurant: restaurantList.restaurants[index],
              );
            },
          ),

          RestaurantNoneState(message: final message) => Center(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Text(
                message,
                textAlign: TextAlign.center,
              ),
            ),
          ),

          RestaurantErrorState(error: final error) => ErrorDisplayWidget(
            message: error,
            onRetry: () => provider.refreshData(),
          ),
        };
      },
    );
  }
}