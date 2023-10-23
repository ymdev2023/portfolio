class Place {
  final String name;
  final double latitude;
  final double longitude;

  Place({required this.name, required this.latitude, required this.longitude});

  Place.fromJson(dynamic json)
      : this(
          name: json["name"] as String,
          latitude: json["latitude"] as double,
          longitude: json["longitude"] as double,
        );

  Map<String, Object?> toJson() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
      };
}
