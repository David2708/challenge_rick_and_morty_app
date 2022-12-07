

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/providers/characters_provider.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

import '../models/all_charcaters_response.dart';

class CharactersScreen extends StatelessWidget {

  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final charcatersProvider = Provider.of<CharactersProvider>(context);
    List<Character> characters = charcatersProvider.charcaters;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          children: [
            
            // Muestra la lista de caracteres
            CharacterBuilder( characters: characters, onNextPage: charcatersProvider.getAllCharacters, ),

            // si es la primera vez que se estan obteniendo los datos no mostrara el loading
            if(charcatersProvider.getIsloading() && charcatersProvider.getMakeRequest() )
              LoadingData(size: size)

          ],
        ),
  
      ),
    );
  }
}