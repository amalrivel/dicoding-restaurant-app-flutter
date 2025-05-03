import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dicoding_restaurant_app/providers/theme_provider.dart';
import 'package:dicoding_restaurant_app/ui/widgets/restaurant/restaurant_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const RestaurantListWidget();
  }
}
