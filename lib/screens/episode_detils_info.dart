
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

import '../models/models.dart';

class EpisodeDetailsInfoScreen extends StatelessWidget {
   
  const EpisodeDetailsInfoScreen({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    final Episode episode =  ModalRoute.of(context)!.settings.arguments as Episode;
    
    return Scaffold(
      body: SafeArea(
        child: Center(
           child: Column(
            children: [
              const SizedBox(height: 50),
              const Text('Episode Info', style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              const SizedBox(height: 50),
              EpisodeInfo( episode: episode )
            ],
           ),
        ),
      ),
    );
  }
}

class EpisodeInfo extends StatelessWidget {

  const EpisodeInfo({
    Key? key, required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CharacterAtrributeAndValue(attribute: 'Name', value: episode.name, size: size),
          CharacterAtrributeAndValue(attribute: 'Air_date', value: episode.airDate, size: size),
          CharacterAtrributeAndValue(attribute: 'Episode', value: episode.episode, size: size),
        ],
      ),
    );
  }
}