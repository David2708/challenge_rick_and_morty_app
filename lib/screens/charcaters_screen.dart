

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
              _LoadingData(size: size)

          ],
        ),
  
      ),
    );
  }
}

class _LoadingData extends StatelessWidget {
  const _LoadingData({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: (size.width / 2) - 50,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle
        ),
        child: const CircularProgressIndicator( color: Colors.grey ),
      ),
    );
  }
}