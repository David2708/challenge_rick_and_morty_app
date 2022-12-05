

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class EpisodesProvider extends ChangeNotifier {


  List<Episode> episodes = [];

  EpisodesProvider(){
    getEpisodes();
  }


  getEpisodes() async {

    final url = Uri.https( 'rickandmortyapi.com',  '/api/episode');
    final response = await http.get(url);
    final newResponse = AllEpisodesModel.fromJson(response.body);

    episodes.addAll(newResponse.results);
    notifyListeners();


  }


}