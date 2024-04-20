import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:dropdown_sample/dto/location_dto.dart';
import 'package:dropdown_sample/services/cupid_api_service.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('CupidApiService', () {

    test('getCountries() returns a list of LocationDto', () async {
      List<LocationDto> countries = await CupidApiService.getCountries();

      expect(
          countries.length, equals(248)); // Adjust this based on the mock data
      expect(countries[0].name, equals("Afghanistan"));
    });

    test('getStates() returns a list of LocationDto', () async {
      // Arrange
      const int mockCountryId = 13; // Australia

      List<LocationDto> states = await CupidApiService.getStates(mockCountryId);

      expect(states.length, equals(8));
      expect(states[0].name, equals('Australian Capital Territory'));
    });
  });

  test('getStates() throws if id does not exist', () async {
    const int mockCountryId = -1; // Non-existent country ID
    expect(() async {
      await CupidApiService.getStates(mockCountryId);
    }, throwsException);
  });
}
