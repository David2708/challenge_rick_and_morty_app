

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/characters_provider.dart';
import 'package:rick_and_morty_app/widgets/widgets.dart';

import '../models/models.dart';

class CharacterSearch extends SearchDelegate{

  late List<Character> characters = [];

  @override
  String? get searchFieldLabel => 'Search Character';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = ''
      )
    ];
  }


  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null) ,
      icon: const Icon(Icons.arrow_back),
    );
  }



  @override
  Widget buildResults(BuildContext context) {

    if(characters.isEmpty) return const NotFound();

    return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) => _CharacterItem( character: characters[index], ),
    );
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    if(query.isEmpty) return const EmptyContainer( icon: Icons.person );

    final charactersProvider = Provider.of<CharactersProvider>(context, listen: false);
    charactersProvider.getSuggestionsByQuery( query );

    return StreamBuilder(
      stream: charactersProvider.suggestionStream,
      builder: ( _ , AsyncSnapshot<List<Character>> snapshot) {
        
        if( !snapshot.hasData ) return const EmptyContainer( icon: Icons.person );

        characters = snapshot.data!;

        if(characters.isEmpty) return const NotFound();

        return ListView.builder(
          itemCount: characters.length,
          itemBuilder: (_, index) => _CharacterItem( character: characters[index], ),
        );
      },

    );

  }

}

class _CharacterItem extends StatelessWidget {
  const _CharacterItem({
    Key? key, required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FadeInImage(
        placeholder: const AssetImage('assets/giphy.gif'),
        image: NetworkImage(character.image),
        width: 50,
        fit: BoxFit.cover,
      ),
      title: Text(character.name),
      trailing: const Icon(Icons.arrow_right),
      onTap: () => Navigator.pushNamed(context, 'character', arguments: character),
    );
  }
}


