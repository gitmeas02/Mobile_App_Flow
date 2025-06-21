import 'package:flutter/material.dart';
import '../widgets/plant_grid_card.dart';

class PlantProvider with ChangeNotifier {
  List<Plant> _plants = [];
  List<Plant> _allPlants = [];
  bool _isLoading = false;
  String? _error;
  bool _hasMoreData = true;

  List<Plant> get plants => _plants;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasMoreData => _hasMoreData;

  // Mock data similar to homepage exclusive offers
  static const List<Plant> _mockPlants = [
    Plant(
      name: "Monstera Deliciosa",
      description: "Indoor tropical plant",
      price: 24.99,
      imagePath: "assets/images/plant1.png",
    ),
    Plant(
      name: "Snake Plant",
      description: "Low maintenance succulent",
      price: 19.99,
      imagePath: "assets/images/plant2.png",
    ),
    Plant(
      name: "Peace Lily",
      description: "Air purifying plant",
      price: 22.99,
      imagePath: "assets/images/plant3.png",
    ),
    Plant(
      name: "Fiddle Leaf Fig",
      description: "Statement houseplant",
      price: 45.99,
      imagePath: "assets/images/plant1.png",
    ),
    Plant(
      name: "Rubber Plant",
      description: "Easy care indoor plant",
      price: 32.99,
      imagePath: "assets/images/plant2.png",
    ),
    Plant(
      name: "Pothos",
      description: "Trailing vine plant",
      price: 18.99,
      imagePath: "assets/images/plant3.png",
    ),
    Plant(
      name: "ZZ Plant",
      description: "Drought tolerant",
      price: 28.99,
      imagePath: "assets/images/plant1.png",
    ),
    Plant(
      name: "Spider Plant",
      description: "Easy propagation",
      price: 16.99,
      imagePath: "assets/images/plant2.png",
    ),
    Plant(
      name: "Aloe Vera",
      description: "Medicinal succulent",
      price: 14.99,
      imagePath: "assets/images/plant3.png",
    ),
    Plant(
      name: "Boston Fern",
      description: "Humidity loving fern",
      price: 21.99,
      imagePath: "assets/images/plant1.png",
    ),
  ];

  PlantProvider() {
    _allPlants = List.from(_mockPlants);
  }

  // Load mock plants with simulated loading
  Future<void> loadPlants({bool refresh = false}) async {
    if (refresh) {
      _plants.clear();
      _hasMoreData = true;
    }

    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final startIndex = _plants.length;
      final endIndex = (startIndex + 6).clamp(0, _allPlants.length);

      if (startIndex >= _allPlants.length) {
        _hasMoreData = false;
      } else {
        final newPlants = _allPlants.sublist(startIndex, endIndex);
        _plants.addAll(newPlants);

        if (_plants.length >= _allPlants.length) {
          _hasMoreData = false;
        }
      }
    } catch (e) {
      _error = 'Failed to load plants: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Search plants in mock data
  Future<void> searchPlants(String query) async {
    if (_isLoading) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    // Simulate search delay
    await Future.delayed(const Duration(milliseconds: 300));

    try {
      final searchResults =
          _allPlants.where((plant) {
            return plant.name.toLowerCase().contains(query.toLowerCase()) ||
                plant.description.toLowerCase().contains(query.toLowerCase());
          }).toList();

      _plants = searchResults;
      _hasMoreData = false; // No pagination for search results
    } catch (e) {
      _error = 'Search failed: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear search and reload all plants
  Future<void> clearSearch() async {
    _plants.clear();
    _hasMoreData = true;
    await loadPlants(refresh: true);
  }
}
