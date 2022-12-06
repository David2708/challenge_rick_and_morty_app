

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/all_charcaters_response.dart';


class CharactersProvider extends ChangeNotifier {

  List<Character> charcaters = [];
  List<Character> singleCharacters = [];
  int _charactersPage = 0;
  bool _isLoading = false;
  bool _makerequest = false;

  Map<String, List<Character>> charactersByLocations = {};
  Map<String, List<Character>> charactersByEpisode = {};


  CharactersProvider(){
    getAllCharacters();
  }

  getIsloading() => _isLoading;
  getMakeRequest() => _makerequest;

  setCharacterPage(int value) => _charactersPage = value;
  

  Future getAllCharacters( ) async {

    if(_isLoading) return;
    
    _isLoading = true;
    _charactersPage ++;
    if ( _charactersPage < 43){
      final url = Uri.https( 'rickandmortyapi.com', '/api/character/' ,{
        'page' : '$_charactersPage'
      });
      final response = await http.get(url);
      final newResponse = AllCharactersResponse.fromJson(response.body);

      charcaters.addAll(newResponse.results);
      _isLoading = false;
      _makerequest = true;
      notifyListeners();
    }
  }

  getASingleCharacter( String id ) async{
    final url = Uri.https( 'rickandmortyapi.com', '/api/character/$id');
    final response = await http.get(url);
    final newResponse = Character.fromJson(response.body);
    return newResponse;
  }

  // Recibe una lista de ids de personajes que aparecen en la ubicacion
  // Recibe el id de la ubicacion para mantener en memoria
  // Retorna una lista de personjes que parecen en la ubicacion
  Future<List<Character>> getcharactersByLocations(String id, List listIds)async{

    if(charactersByLocations.containsKey(id)) return charactersByLocations[id]!;

    List<Character> listCharacters = [];

    for (String item in listIds) {
      listCharacters.add( await getASingleCharacter(item));
    }

    charactersByLocations[id] = listCharacters;

    return listCharacters;
  }

  // Recibe una lista de ids de personajes que aparecen en ese episodio
  // Recibe el id del episodio para mantener en memoria
  // Retorna una lista de personjes que parecen en el episodio
  Future<List<Character>> getcharactersByEpisode(String id, List listIds)async{

    if(charactersByEpisode.containsKey(id)) return charactersByEpisode[id]!;

    List<Character> listCharacters = [];

    for (String item in listIds) {
      listCharacters.add( await getASingleCharacter(item));
    }

    charactersByEpisode[id] = listCharacters;

    return listCharacters;
  }
  

}