class SavedItem {
  final String title;
  final String? subtitle;
  final String? iconAsset; // Or IconData
  final String? type; // e.g., "route", "ride", "place"

  // Specific to Places
  final String? imageUrl;
  final List<String>? images;
  final String? description;
  final double? rating;
  final int? reviewCount;
  final String? status;

  SavedItem({
    required this.title,
    this.subtitle,
    this.iconAsset,
    this.type,
    this.imageUrl,
    this.images,
    this.description,
    this.rating,
    this.reviewCount,
    this.status,
  });
}

class RideDetail {
  final String title;
  final String startLocation;
  final String endLocation;
  final String distance;
  final String eta;
  final String batteryNeeded;
  final String price;

  RideDetail({
    required this.title,
    required this.startLocation,
    required this.endLocation,
    required this.distance,
    required this.eta,
    required this.batteryNeeded,
    required this.price,
  });
}
