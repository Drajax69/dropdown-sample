import 'package:dropdown_sample/dto/location_dto.dart';
import 'package:dropdown_sample/services/cupid_api_service.dart';
import 'package:dropdown_sample/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<LocationDto> _countries = [];
  LocationDto? _selectedCountry; // Currently selected country
  List<LocationDto> _states = []; // List to hold states
  LocationDto? _selectedState;
  final double _dropdownWidth = 200;
  final double _dropdownHeight = 50;
  final String congratsText =
      'Congratulations! You are a capable human being who can use dropdowns.';

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  // Method to load countries from the service
  void _loadCountries() async {
    List<LocationDto> countries = await CupidApiService.getCountries();
    setState(() {
      _countries = countries;
    });
  }

  // Method to load states based on selected country
  void _loadStates(int? countryId) async {
    if (countryId == null) {
      return;
    }
    List<LocationDto> states = await CupidApiService.getStates(countryId);
    setState(() {
      _states = states;
      _selectedState = null; // Clear selected state when country changes
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country and State Selector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown<LocationDto>(
              value: _selectedCountry,
              width: _dropdownWidth,
              height: _dropdownHeight,
              hint: 'Country',
              items: _countries,
              onChanged: (value) {
                setState(() {
                  _selectedCountry = value;
                  _loadStates(value?.id);
                });
              },
            ),
            const SizedBox(height: 20),
            CustomDropdown<LocationDto>(
              width: _dropdownWidth,
              height: _dropdownHeight,
              value: _selectedState,
              hint: 'State',
              items: _states,
              onChanged: (value) {
                setState(() {
                  _selectedState = value;
                });
              },
            ),
            const SizedBox(height: 20),
            if (_selectedCountry != null && _selectedState != null)
              Text(congratsText)
          ],
        ),
      ),
    );
  }
}
