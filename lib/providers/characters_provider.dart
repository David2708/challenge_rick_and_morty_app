

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:rick_and_morty_app/models/all_charcaters_response.dart';


class CharactersProvider extends ChangeNotifier {

  List<Character> charcaters = [];
  List<Character> singleCharacters = [];

  Map<String, List<Character>> charactersByLocations = {};


  CharactersProvider(){
    getAllCharacters();
  }


  Future getAllCharacters( ) async {
    final url = Uri.https( 'rickandmortyapi.com', '/api/character' );
    final response = await http.get(url);
    final newResponse = AllCharactersResponse.fromJson(response.body);

    charcaters.addAll(newResponse.results);
    notifyListeners();
  }

  getASingleCharacter( String id ) async{
    final url = Uri.https( 'rickandmortyapi.com', '/api/character/$id');
    final response = await http.get(url);
    final newResponse = Character.fromJson(response.body);
    return newResponse;
  }

 
  Future<List<Character>> getcharactersByLocations(String id, List listIds)async{
    print('Haciendo peticiones');

    if(charactersByLocations.containsKey(id)) return charactersByLocations[id]!;

    List<Character> listCharacters = [];

    for (String item in listIds) {
      listCharacters.add( await getASingleCharacter(item));
    }

    charactersByLocations[id] = listCharacters;

    return listCharacters;
 }
  

}