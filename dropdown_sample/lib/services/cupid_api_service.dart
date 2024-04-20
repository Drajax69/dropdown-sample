import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dropdown_sample/dto/location_dto.dart';

class CupidApiService {
  static const String baseUrl = 'https://api.stagingcupid.com/api/v1';
  static const String apiKey = 'sA,{tzUD=]dHvYNBJ4xVZ3c=&zS%.UqVc{But?kc';
  static const String userAgent =
      'com.stagingcupid.api/10.16.6 (Release) Android/31';

  static Future<List<LocationDto>> getCountries() async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries'),
      headers: {
        'X-API-Key': apiKey,
        'User-Agent': userAgent,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<LocationDto> countries =
          data.map((json) => LocationDto.fromJson(json)).toList();
      return countries;
    } else {
      throw Exception('Failed to load countries');
    }
  }

  static Future<List<LocationDto>> getStates(int countryId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/countries/$countryId/states'),
      headers: {
        'X-API-Key': apiKey,
        'User-Agent': userAgent,
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<LocationDto> states =
          data.map((json) => LocationDto.fromJson(json)).toList();
      return states;
    } else {
      throw Exception('Failed to load states');
    }
  }
}
