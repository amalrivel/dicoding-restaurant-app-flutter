import 'package:flutter/material.dart';
import 'package:dicoding_restaurant_app/data/models/restaurant.dart';
import 'package:dicoding_restaurant_app/data/services/image_url_builder.dart';
import 'package:dicoding_restaurant_app/config/constants/app_constants.dart';

class RestaurantCardWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCardWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.cardBorderRadius),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 8,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => RestaurantDetailScreen(id: restaurant.id),
          //   ),
          // );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with overlay gradient and rating badge
            Stack(
              children: [
                // Hero image
                Hero(
                  tag: restaurant.id,
                  child: Image.network(
                    ImageUrlBuilder.medium(restaurant.pictureId),
                    height: AppConstants.imageHeight,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, error, _) => Container(
                      height: AppConstants.imageHeight,
                      color: theme.colorScheme.surfaceVariant,
                      child: Center(
                        child: Icon(
                          Icons.restaurant,
                          size: 60,
                          color: theme.colorScheme.primary.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Gradient overlay for better text visibility
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.6),
                        ],
                        stops: const [0.6, 1.0],
                      ),
                    ),
                  ),
                ),
                
                // City badge
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: AppConstants.locationIconSize,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.city,
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Rating badge
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.star,
                          size: AppConstants.ratingIconSize,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.rating.toStringAsFixed(1),
                          style: theme.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                // Restaurant name at bottom of image
                Positioned(
                  left: AppConstants.defaultPadding,
                  right: AppConstants.defaultPadding,
                  bottom: AppConstants.defaultPadding,
                  child: Text(
                    restaurant.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          color: Colors.black54,
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}