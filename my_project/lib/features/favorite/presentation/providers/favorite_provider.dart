import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../plant/data/models/plant.dart';

// Favorites provider that manages the list of favorite plants
final favoriteProvider = StateNotifierProvider<FavoriteNotifier, List<Plant>>((
  ref,
) {
  return FavoriteNotifier();
});

// Favorite count provider
final favoriteCountProvider = Provider<int>((ref) {
  final favorites = ref.watch(favoriteProvider);
  return favorites.length;
});

class FavoriteNotifier extends StateNotifier<List<Plant>> {
  FavoriteNotifier() : super([]);

  // Add a plant to favorites
  void addToFavorites(Plant plant) {
    if (!state.any((p) => p.name == plant.name)) {
      state = [...state, plant];
    }
  }

  // Remove a plant from favorites
  void removeFromFavorites(Plant plant) {
    state = state.where((p) => p.name != plant.name).toList();
  }

  // Toggle favorite status
  void toggleFavorite(Plant plant) {
    if (isFavorite(plant)) {
      removeFromFavorites(plant);
    } else {
      addToFavorites(plant);
    }
  }

  // Check if a plant is in favorites
  bool isFavorite(Plant plant) {
    return state.any((p) => p.name == plant.name);
  }

  // Clear all favorites
  void clearFavorites() {
    state = [];
  }
}
