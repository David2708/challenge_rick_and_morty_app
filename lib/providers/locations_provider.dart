import 'package:flutter/material.dart';

import '../models/all_locations_model.dart';
import 'package:http/http.dart' as http;



class LocationsProvider extends ChangeNotifier{

  List<Location> locations = [];


  LocationsProvider(){
    getAllLocations();
  }
  

  getAllLocations( ) async {

    final url = Uri.https( 'rickandmortyapi.com', '/api/location' );
    final response = await http.get(url);
    final newResponse = AllLocationsModel.fromJson(response.body);

    locations.addAll(newResponse.results);
    notifyListeners();
  
  } 


}