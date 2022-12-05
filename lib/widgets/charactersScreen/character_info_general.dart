
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/all_charcaters_response.dart';

class CharacterInfoGeneral extends StatelessWidget {

  const CharacterInfoGeneral({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      height: 160,
      decoration: _decorationContainer(),
      child: Row(
        children: [

          _CharacterImage(urlImage: character.image),

          _CharacterInfo(size: size, character: character,),

        ],
      ),
    );
  }

  BoxDecoration _decorationContainer() {
    return BoxDecoration(
      color: Colors.grey.shade700,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade900,
          blurRadius: 5,
          offset: const Offset(5,10)
        )
      ] 
    );
  }
}

class _CharacterInfo extends StatelessWidget {
  const _CharacterInfo({
    Key? key,
    required this.size, required this.character,
  }) : super(key: key);

  final Size size;
  final Character character;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: size.width - 200),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(character.name, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
            Row(
              children: [
                Text(character.status),
                const Text(' - '),
                Text(character.species)
              ],
            ),
            const Text('First seen in::'),
            Text(character.origin.name),
    
            const Text('Last known location:'),
            Text(character.location.name),
            
          ],
        ),
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {

  const _CharacterImage({
    Key? key, required this.urlImage,
  }) : super(key: key);

  final String urlImage;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only( topLeft: Radius.circular(20) , bottomLeft:  Radius.circular(20) ),
      child: FadeInImage(
        placeholder: const AssetImage('assets/giphy.gif'), 
        image: NetworkImage( urlImage ),
        height: 160,
        width: 160,
      ),
    );
  }
}