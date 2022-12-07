
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../helpers/debouncer.dart';
import '../models/models.dart';

class EpisodesProvider extends ChangeNotifier {

  late int _episodePage;
  bool _isloading = false;
  late bool _makeRequest;
  List<Episode> episodes = [];

  Map<String, List<Episode>> episodesByCharacter = {};


  final debouncer = Debouncer(
    duration: const Duration( milliseconds: 500 ),
  );


  EpisodesProvider(){
    _episodePage = 1;
    _makeRequest = false;
    getEpisodes();
  }

  final StreamController<List<Episode>> _suggestionStreamController = StreamController.broadcast();

  Stream<List<Episode>> get suggestionStream => _suggestionStreamController.stream;

  getIsloading() => _isloading;
  getmakeRequest() => _makeRequest;

  Future<Episode> getEpisodeById( String id ) async{
    final url = Uri.https( 'rickandmortyapi.com', '/api/episode/$id');
    final response = await http.get(url);
    final newResponse = Episode.fromJson(response.body);
    return newResponse;
  }

  Future<List<Episode>> getEpisodesByCharacter(String id, List idsEpisodes)async{

    if(episodesByCharacter.containsKey(id)) return episodesByCharacter[id]!;
    
    List<Episode> listCharacters = [];
    
    for (String item in idsEpisodes) {
      listCharacters.add( await getEpisodeById(item));
    }
    episodesByCharacter[id] = listCharacters;
    return listCharacters;

  }



  Future<List<Episode>> getEpisodeByName( String name ) async {

    final url = Uri.https( 'rickandmortyapi.com' , '/api/episode/', {
      'name' : name
    });
    final response = await http.get(url);
    if ( response.statusCode == 200 ){
      final newResponse = AllEpisodesModel.fromJson(response.body);
      return newResponse.results;
    }

    return [];

  }

  getEpisodes() async {

    if(_isloading) return;

    if(_episodePage <= 3){
      _isloading = true;
      final url = Uri.https( 'rickandmortyapi.com', '/api/episode', {
      'page': '$_episodePage' 
      });
      final response = await http.get(url);
      final newResponse = AllEpisodesModel.fromJson(response.body);
      episodes.addAll(newResponse.results);
      _isloading = false;
      _makeRequest = true;
      _episodePage++;
      notifyListeners();
    }
  }

  void getSuggestionsByQuery(String searchTerm){
    debouncer.value = '';
    debouncer.onValue =(value) async {
      final results = await getEpisodeByName(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 200), ( _ ) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration( milliseconds: 201 )).then((value) => timer.cancel());

  }


}