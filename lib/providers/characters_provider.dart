

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty_app/helpers/debouncer.dart';

import 'package:rick_and_morty_app/models/all_charcaters_response.dart';


class CharactersProvider extends ChangeNotifier {

  List<Character> charcaters = [];
  List<Character> singleCharacters = [];
  late int _charactersPage;
  bool _isLoading = false;
  late bool _makeRequest;

  final debouncer = Debouncer(
    duration: const Duration( milliseconds: 500 ),
  );

  Map<String, List<Character>> charactersByLocations = {};
  Map<String, List<Character>> charactersByEpisode = {};


  CharactersProvider(){
    _charactersPage = 1;
    _makeRequest = false;
    getAllCharacters();
  }

  getIsloading() => _isLoading;
  getMakeRequest() => _makeRequest;

  setCharacterPage(int value) => _charactersPage = value;
  

  Future getAllCharacters( ) async {

    if(_isLoading) return;
    
    if ( _charactersPage <= 42){
      _isLoading = true;
      final url = Uri.https( 'rickandmortyapi.com', '/api/character/' ,{
        'page' : '$_charactersPage'
      });
      final response = await http.get(url);
      final newResponse = AllCharactersResponse.fromJson(response.body);

      charcaters.addAll(newResponse.results);
      _isLoading = false;
      _makeRequest = true;
      _charactersPage ++;
      notifyListeners();
    }
  }

  final StreamController<List<Character>> _suggestionStreamController = StreamController.broadcast();

  Stream<List<Character>> get suggestionStream => _suggestionStreamController.stream;


  Future<List<Character>> getCharacterByName( String name ) async {

    final url = Uri.https( 'rickandmortyapi.com' , '/api/character/', {
      'name' : name
    });
    final response = await http.get(url);
    if ( response.statusCode == 200 ){
      final newResponse = AllCharactersResponse.fromJson(response.body);
      return newResponse.results;
    }

    return [];

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
  

  void getSuggestionsByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue =(value) async {
      final results = await getCharacterByName(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 200), ( _ ) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration( milliseconds: 201 )).then((value) => timer.cancel());

  }


}