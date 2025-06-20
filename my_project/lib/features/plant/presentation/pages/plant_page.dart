import 'package:flutter/material.dart';
import '../providers/plant_provider.dart';
import '../widgets/plant_search_bar.dart';
import '../widgets/plant_list_view.dart';
import '../widgets/plant_error_view.dart';
import '../widgets/plant_loading_view.dart';
import '../widgets/plant_empty_view.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  final PlantProvider _plantProvider = PlantProvider();
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _setupScrollListener();
    _plantProvider.addListener(_onPlantProviderChange);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _plantProvider.removeListener(_onPlantProviderChange);
    _plantProvider.dispose();
    super.dispose();
  }

  void _loadInitialData() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _plantProvider.loadPlants(refresh: true);
    });
  }

  void _setupScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (_plantProvider.hasMoreData && !_plantProvider.isLoading) {
          _plantProvider.loadPlants();
        }
      }
    });
  }

  void _onPlantProviderChange() {
    setState(() {});
  }

  void _onSearchChanged(String query) {
    if (query.trim().isEmpty) {
      _plantProvider.clearSearch();
    } else if (query.length >= 3) {
      _plantProvider.searchPlants(query);
    }
  }

  void _onClearSearch() {
    _searchController.clear();
    _plantProvider.clearSearch();
  }

  void _onRefresh() {
    _plantProvider.loadPlants(refresh: true);
  }

  void _onRetry() {
    _plantProvider.loadPlants(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('See All Exclusive Offer'),
        backgroundColor: const Color(0xFF53B175),
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _onRefresh),
        ],
      ),
      body: Column(
        children: [
          PlantSearchBar(
            controller: _searchController,
            onSearchChanged: _onSearchChanged,
            onClearSearch: _onClearSearch,
          ),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_plantProvider.error != null) {
      return PlantErrorView(error: _plantProvider.error!, onRetry: _onRetry);
    }

    if (_plantProvider.plants.isEmpty && _plantProvider.isLoading) {
      return const PlantLoadingView();
    }

    if (_plantProvider.plants.isEmpty) {
      return const PlantEmptyView();
    }

    return PlantListView(
      plants: _plantProvider.plants,
      scrollController: _scrollController,
      isLoading: _plantProvider.isLoading,
      hasMoreData: _plantProvider.hasMoreData,
    );
  }
}
