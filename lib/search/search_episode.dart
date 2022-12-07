    
    

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/episodes_provider.dart';

import '../models/all_episodes_model.dart';

class SearchEpisodeDelegate extends SearchDelegate{

  List<Episode> episodes = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = ''
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null) ,
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if(episodes.isEmpty) return Container();
    
    return ListView.builder(
          itemCount: episodes.length,
          itemBuilder: (context, index) => _EpisodeItem( episode: episodes[index] )
    );
  }

  Widget _emptyContainer(){
    return const Center(
        child: Icon(Icons.location_on_outlined, color: Colors.grey, size: 100), 
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if (query == '') return _emptyContainer();

    final episodesProvider = Provider.of<EpisodesProvider>(context, listen: false);
    episodesProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: episodesProvider.suggestionStream,
      builder: (BuildContext context, AsyncSnapshot<List<Episode>> snapshot) {

        if (!snapshot.hasData) return _emptyContainer();

        episodes = snapshot.data!;

        return ListView.builder(
          itemCount: episodes.length,
          itemBuilder: (context, index) => _EpisodeItem( episode: episodes[index] )
        );
      },
    );
  }


}

class _EpisodeItem extends StatelessWidget {

  const _EpisodeItem({
    Key? key, required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(episode.name),
      trailing: const Icon(Icons.arrow_right),
      onTap: () => Navigator.pushNamed(context, 'episode', arguments: episode),
    );
  }
}