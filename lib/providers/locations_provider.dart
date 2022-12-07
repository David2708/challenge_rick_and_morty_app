import 'dart:async';

import 'package:flutter/material.dart';

import '../helpers/debouncer.dart';
import '../models/all_locations_model.dart';
import 'package:http/http.dart' as http;




class LocationsProvider extends ChangeNotifier{

  List<Location> locations = [];
  late int _locationPage;
  bool _isLoading = false;
  late bool _makeRequest; // ya se hizo una peticion ?

  final debouncer = Debouncer(
    duration: const Duration( milliseconds: 500 ),
  );


  LocationsProvider(){
    _locationPage = 1;
    _makeRequest = false;
    getAllLocations();
  }

  final StreamController<List<Location>> _suggestionStreamController = StreamController.broadcast();

  Stream<List<Location>> get suggestionStream => _suggestionStreamController.stream;

  getIsloading() => _isLoading;
  getMakeRequest() => _makeRequest;


  Future<List<Location>> getLocationByName( String name ) async {

    final url = Uri.https( 'rickandmortyapi.com' , '/api/location/', {
      'name' : name
    });
    final response = await http.get(url);
    if ( response.statusCode == 200 ){
      final newResponse = AllLocationsModel.fromJson(response.body);
      return newResponse.results;
    }

    return [];

  }

  

  getAllLocations( ) async {

    if(_isLoading) return;
    
    if(_locationPage <= 7){
      _isLoading = true;
      final url = Uri.https( 'rickandmortyapi.com', '/api/location/', {
        'page':'$_locationPage'
      } );

      final response = await http.get(url);
      final newResponse = AllLocationsModel.fromJson(response.body);
      locations.addAll(newResponse.results);

      _isLoading = false;
      _makeRequest = true;
      _locationPage++;
      notifyListeners();
    
    }
  } 

  void getSuggestionsByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue =(value) async {
      final results = await getLocationByName(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 200), ( _ ) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration( milliseconds: 201 )).then((value) => timer.cancel());

  }


}