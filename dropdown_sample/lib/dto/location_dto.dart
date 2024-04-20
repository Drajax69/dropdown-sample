class LocationDto {
  final String name;
  final int id;

  LocationDto({required this.name, required this.id});

  factory LocationDto.fromJson(Map<String, dynamic> json) {
    return LocationDto(
      name: json['value'] as String,
      id: json['id'] as int,
    );
  }

  @override
  String toString() {
    return name;
  }
}
