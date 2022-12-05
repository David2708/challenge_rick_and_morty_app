import 'package:flutter/material.dart';

import '../../models/all_charcaters_response.dart';
import '../widgets.dart';


class CharacterStatus extends StatelessWidget {

  const CharacterStatus({
    Key? key, required this.character, required this.size,
  }) : super(key: key);

  final Character character;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(
            width: size.width*0.45 - 20,
            child: const Text('Status', style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          ),

          SizedBox(
            width: size.width*0.55 - 20,
            child: Row(
              children: [
                StatusIndicator(character: character),
                const SizedBox( width: 8, ),
                Text(character.status, style: const TextStyle( fontSize: 15 ))
              ],
            ),
          ),

        ],
      ),
    );
  }
}