
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/all_locations_model.dart';

import '../widgets/widgets.dart';

class LocationDetailInfoScreen extends StatelessWidget {
   
  const LocationDetailInfoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Location location =  ModalRoute.of(context)!.settings.arguments as Location;
    
    return Scaffold(
      body: SafeArea(
        child: Center(
           child: Column(
            children: [
              const SizedBox(height: 50),
              const Text('Location Info', style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              const SizedBox(height: 50),
              EpisodeInfo( location: location )
            ],
           ),
        ),
      ),
    );
  }
}



class EpisodeInfo extends StatelessWidget {

  const EpisodeInfo({
    Key? key, required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CharacterAtrributeAndValue(attribute: 'Name', value: location.name, size: size),
          CharacterAtrributeAndValue(attribute: 'Type', value: location.type, size: size),
          CharacterAtrributeAndValue(attribute: 'Dimension', value: location.dimension, size: size),
        ],
      ),
    );
  }
}