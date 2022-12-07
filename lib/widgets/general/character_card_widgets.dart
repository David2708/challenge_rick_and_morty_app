import 'package:flutter/material.dart';

import '../../models/models.dart';

class CharacterCard extends StatelessWidget {

  const CharacterCard({
    Key? key, required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric( horizontal: 10 ),
      width: 140,
      child: Column(
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'), 
              image: NetworkImage(character.image),
              width: 140,
              height: 180,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text( character.name , overflow: TextOverflow.ellipsis,),
          )

        ],
      ),
    );
  }
}