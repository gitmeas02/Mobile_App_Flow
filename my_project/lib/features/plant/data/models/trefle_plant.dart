import 'package:my_project/features/plant/data/models/plant.dart';

import '../../presentation/widgets/plant_grid_card.dart';

class TreflePlant {
  final int id;
  final String? commonName;
  final String scientificName;
  final String? slug;
  final String? imageUrl;
  final String? familyCommonName;
  final String? family;
  final String? genus;
  final List<String>? duration;
  final bool? edible;
  final List<String>? ediblePart;
  final bool? vegetable;
  final String? observations;

  const TreflePlant({
    required this.id,
    this.commonName,
    required this.scientificName,
    this.slug,
    this.imageUrl,
    this.familyCommonName,
    this.family,
    this.genus,
    this.duration,
    this.edible,
    this.ediblePart,
    this.vegetable,
    this.observations,
  });

  factory TreflePlant.fromJson(Map<String, dynamic> json) {
    return TreflePlant(
      id: json['id'] ?? 0,
      commonName: json['common_name'],
      scientificName: json['scientific_name'] ?? '',
      slug: json['slug'],
      imageUrl: json['image_url'],
      familyCommonName: json['family_common_name'],
      family: json['family'],
      genus: json['genus'],
      duration:
          json['duration'] != null ? List<String>.from(json['duration']) : null,
      edible: json['edible'],
      ediblePart:
          json['edible_part'] != null
              ? List<String>.from(json['edible_part'])
              : null,
      vegetable: json['vegetable'],
      observations: json['observations'],
    );
  }

  // Convert TreflePlant to the existing Plant model
  Plant toPlant() {
    return Plant(
      name: commonName ?? scientificName,
      description: observations ?? familyCommonName ?? 'Beautiful plant',
      price: 15.99 + (id % 20), // Generate price based on ID
      imagePath: imageUrl ?? 'assets/images/plant.png',
    );
  }
}
