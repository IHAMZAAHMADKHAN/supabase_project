class RouteInfoModel {
  final String? routeType; // e.g., "Fastest Route"
  final double? distanceKm;
  final int? batteryLevel;
  final double? price;
  final String? currency;

  RouteInfoModel({
    this.routeType,
    this.distanceKm,
    this.batteryLevel,
    this.price,
    this.currency,
  });
}
