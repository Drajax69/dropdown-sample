import 'package:dropdown_sample/dto/location_dto.dart';

class CupidApiService {
  static Future<List<LocationDto>> getCountries() async {
    // Mock implementation: returning sample data
    await Future.delayed(
        const Duration(seconds: 1)); 
    return [LocationDto(name: "Aus", id: "1")]; // Sample list of countries
  }

  static Future<List<LocationDto>> getStates(String countryId) async {
    // Mock implementation: returning sample data based on selected country
    await Future.delayed(
        const Duration(seconds: 1)); 
    return [LocationDto(name: "QLD", id: "123")];
  }
}
