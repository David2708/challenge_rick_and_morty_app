import 'package:flutter/material.dart';

import '../models/all_locations_model.dart';
import 'package:http/http.dart' as http;



class LocationsProvider extends ChangeNotifier{

  List<Location> locations = [];
  late int _locationPage;
  bool _isLoading = false;
  late bool _makeRequest; // ya se hizo una peticion ?



  LocationsProvider(){
    _locationPage = 0;
    _makeRequest = false;
    getAllLocations();
  }

  getIsloading() => _isLoading;
  getMakeRequest() => _makeRequest;
  

  getAllLocations( ) async {

    if(_isLoading) return;

    _locationPage++;
    if(_locationPage < 8){

      _isLoading = true;
       
      final url = Uri.https( 'rickandmortyapi.com', '/api/location/', {
        'page':'$_locationPage'
      } );

      final response = await http.get(url);
      final newResponse = AllLocationsModel.fromJson(response.body);

      locations.addAll(newResponse.results);

      _isLoading= false;
      _makeRequest = true;
      notifyListeners();
    
    }
   
  
  } 


}