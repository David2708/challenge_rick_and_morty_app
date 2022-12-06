

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/providers/episodes_provider.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

import '../models/models.dart';

class EpisodesScreen extends StatelessWidget {
   
  const EpisodesScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final episodesProvider = Provider.of<EpisodesProvider>(context);

    List<Episode> episodes = episodesProvider.episodes;


    return  Scaffold(
      appBar: AppBar(
        title: const Text('Episodes'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: episodes.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.grey))
          : ListView.builder(
            itemCount: episodes.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'episode', arguments: episodes[index]) ,
              child: InformationNameWidget(name: episodes[index].name,),
            ),
          ),
      )
    );
  }
}