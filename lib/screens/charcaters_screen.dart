

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/providers/characters_provider.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

import '../models/all_charcaters_response.dart';

class CharactersScreen extends StatelessWidget {
   
  const CharactersScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final charcatersProvider = Provider.of<CharactersProvider>(context);

    List<Character> characters = charcatersProvider.charcaters;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: characters.length,
          itemBuilder: (context, index) => CharacterInfoGeneral(character: characters[index]),
        ),
      ),
    );
  }
}