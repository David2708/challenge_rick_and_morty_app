

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/providers/episodes_provider.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

import '../models/models.dart';
import '../search/search_episode.dart';

class EpisodesScreen extends StatelessWidget {
   
  const EpisodesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final episodesProvider = Provider.of<EpisodesProvider>(context);
    List<Episode> episodes = episodesProvider.episodes;

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: SearchEpisodeDelegate()),
          )
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: EpisodeBuilder(episodes: episodes, onNexPage: episodesProvider.getEpisodes,)
          ),

          if(episodesProvider.getmakeRequest() && episodesProvider.getIsloading())
            const LoadingData()
        ],
      )
    );
  }
}