import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/episodes_provider.dart';

import '../../models/models.dart';
import '../widgets.dart';


class EpisodesByCharacter extends StatelessWidget {

  const EpisodesByCharacter({
    Key? key, required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {

    final episodesProvider = Provider.of<EpisodesProvider>(context, listen: false);
    
    List idsEpisodes = [];
    //Extraemos el id de cada personaje que aparece en el episodio
    idsEpisodes.addAll(character.episode.map((e) => e.substring(40)));

    return FutureBuilder(
      // Mandamos el id del episodio y una lista con los ids de los personaje
      // Retorna una lista de personajes
      future: episodesProvider.getEpisodesByCharacter(character.id.toString(), idsEpisodes),
      builder: ( _ , AsyncSnapshot<List<Episode>> snapshot) {

        if( !snapshot.hasData ){
          return const SizedBox(
            height: 40,
            width: double.infinity,
            child:  Center(
              child: CircularProgressIndicator( color: Colors.grey,),
            ),
          );
        }

        final List<Episode> episodes = snapshot.data!;

        return SizedBox(
          height: 40,
          width: double.infinity,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: episodes.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'episode', arguments: episodes[index]),
              child: SliderNameEpisodeos( name: episodes[index].name, ),
            ),
          ),
        );
      },
    
    );
  }
}

