class LocationModel {
  final String title;
  final String subtitle;
  final String description;
  final List<String> imageUrls;
  bool isBookmarked;

  LocationModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrls,
    this.isBookmarked = false,
  });
}
