
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class EpisodesProvider extends ChangeNotifier {

  late int _epidosePage;
  bool _isloading = false;
  late bool _makeRequest;
  List<Episode> episodes = [];

  EpisodesProvider(){
    _epidosePage = 1;
    _makeRequest = false;
    getEpisodes();
  }

  getIsloading() => _isloading;

  getmakeRequest() => _makeRequest;


  getEpisodes() async {

    if(_isloading) return;

    if(_epidosePage <= 3){
      _isloading = true;
      final url = Uri.https( 'rickandmortyapi.com', '/api/episode', {
      'page': '$_epidosePage' 
      });
      final response = await http.get(url);
      final newResponse = AllEpisodesModel.fromJson(response.body);
      episodes.addAll(newResponse.results);
      _isloading = false;
      _makeRequest = true;
      _epidosePage++;
      notifyListeners();
    }


  }


}