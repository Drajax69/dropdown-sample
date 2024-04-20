import 'package:dropdown_sample/dto/location_dto.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LocationDto', () {
    test('fromJson() creates a LocationDto instance from JSON', () {
      Map<String, dynamic> json = {'value': 'LocationName', 'id': 123};
      LocationDto location = LocationDto.fromJson(json);

      expect(location.name, equals('LocationName'));
      expect(location.id, equals(123));
    });

    test('toString() returns the name of the location', () {
      LocationDto location = LocationDto(name: 'Test Location', id: 456);

      String result = location.toString();
      expect(result, equals('Test Location'));
    });
  });
}
