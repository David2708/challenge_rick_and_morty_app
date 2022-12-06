
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/characters_provider.dart';

import '../models/models.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 50),

              const Padding(
                padding:  EdgeInsets.only(left: 20),
                child:  Text('Location Info', style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 50),

              LocationInfo( location: location ),
              const SizedBox(height: 50),

              const Padding(
                padding: EdgeInsets.only( left: 20 ),
                child: Text('Residents', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 30),
              
              ResidentsByLocations(location: location)

            ],
           ),
        ),
      ),
    );
  }
}

class ResidentsByLocations extends StatelessWidget {
  const ResidentsByLocations({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {

    final charactersProvider = Provider.of<CharactersProvider>(context, listen: false);
    List idsCharacter = [];
    idsCharacter.addAll(location.residents.map((e) => e.substring(42)));

    return FutureBuilder(
      future: charactersProvider.getcharactersByLocations(location.id.toString(), idsCharacter),
      builder: ( _ , AsyncSnapshot<List<Character>> snapshot) {

        if( !snapshot.hasData ){
          return const Center(
            child: CircularProgressIndicator( color: Colors.grey,),
          );
        }

        final List<Character> characters = snapshot.data!;

        return SizedBox(
          height: 220,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: characters.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'character', arguments: characters[index]),
              child: CharacterCard(character: characters[index]),
            ),
          ),
        );
      },
    
    );
  }
}



class LocationInfo extends StatelessWidget {

  const LocationInfo({
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