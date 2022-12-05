

import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/all_charcaters_response.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

class CharacterDetailInfoScreen extends StatelessWidget {
   
  const CharacterDetailInfoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Character character = ModalRoute.of(context)!.settings.arguments as Character;

    return  Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Imagen y nombre del personaje
            _CustomAppBar(character: character),
            SliverList(
              delegate: SliverChildListDelegate([

                _DetailsInfo( character: character ),

                

                const SizedBox(height: 500,)
              ]),
            ),
          ],
        ),
      )
    );
  }
}

class _DetailsInfo extends StatelessWidget {

  const _DetailsInfo({
    Key? key, required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: Column(
          children: [
            CharacterStatus( character: character, size: size, ),
            Container( margin: const EdgeInsets.only( bottom: 20 ) ),
            CharacterAtrributeAndValue( attribute: 'Species', value: character.species, size: size, ),
            if (character.type != '')
              CharacterAtrributeAndValue( attribute: 'Type', value: character.type, size: size, ),
            CharacterAtrributeAndValue( attribute: 'Gender', value: character.gender, size: size, ),
            CharacterAtrributeAndValue( attribute: 'First seen in', value: character.origin.name, size: size, ),
            CharacterAtrributeAndValue( attribute: 'Last known location', value: character.location.name, size: size, ),
          ],
        ),
      ),
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  final Character character;
   
  const _CustomAppBar({
    Key? key, 
    required this.character
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 200,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          titlePadding: const EdgeInsets.all(0),
          title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            padding: const EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                character.name,
                style: const TextStyle(fontSize: 16),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                ),
            ),
          ),
          background: FadeInImage(
            placeholder: const AssetImage('assets/giphy.gif'), 
            image: NetworkImage(character.image),
            fit: BoxFit.cover,
          ),
        ),
    );
  }
}