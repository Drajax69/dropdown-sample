class LocationDto {
  final String name;
  final String id;

  LocationDto({required this.name, required this.id});

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
      name: json['name'],
      id: json['id'],
    );
  }

  @override
  String toString() {
    return name;
  }
}
