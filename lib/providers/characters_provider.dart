

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/all_charcaters_response.dart';


class CharactersProvider extends ChangeNotifier {

  List<Character> charcaters = [];


  CharactersProvider(){
    getAllCharacters();
  }


  getAllCharacters( ) async {

    final url = Uri.https( 'rickandmortyapi.com', '/api/character' );
    final response = await http.get(url);
    final newResponse = AllCharactersResponse.fromJson(response.body);

    charcaters.addAll(newResponse.results);
    notifyListeners();
  } 

}