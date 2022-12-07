
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 50),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Episode Info', style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 50),

              EpisodeInfo( episode: episode ),
              const SizedBox(height: 50),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text('Characters in this episode', style: TextStyle( fontSize: 20 , fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 30),

              CharactersByEpisode( episode: episode, )

            ],
           ),
        ),
      ),
    );
  }
}


