import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/providers/characters_provider.dart';

import '../../models/models.dart';
import '../widgets.dart';

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
    //Extraemos el id de cada personaje que aparece en la ubicacion
    idsCharacter.addAll(location.residents.map((e) => e.substring(42)));

    return FutureBuilder(
      // Mandamos el id del episodio y una lista con los ids de los personaje
      // Retorna una lista de personajes
      future: charactersProvider.getcharactersByLocations(location.id.toString(), idsCharacter),
      builder: ( _ , AsyncSnapshot<List<Character>> snapshot) {

        if( !snapshot.hasData ){
          return const SizedBox(
            height: 220,
            width: double.infinity,
            child:  Center(
              child: CircularProgressIndicator( color: Colors.grey,),
            ),
          );
        }

        final List<Character> characters = snapshot.data!;

        return SizedBox(
          height: 220,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
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