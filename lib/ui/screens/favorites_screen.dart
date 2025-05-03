import 'package:flutter/material.dart';
import 'package:dicoding_restaurant_app/config/constants/app_constants.dart';
import 'package:dicoding_restaurant_app/ui/widgets/restaurant/restaurant_list.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Setelah Anda mengimplementasikan favorit, ganti konten ini
    return const Center(
      child: Text('Favorites will be shown here'),
    );
    
    // Nantinya Anda akan buat widget khusus untuk menampilkan favorit
    // return const FavoriteRestaurantList();
  }
}