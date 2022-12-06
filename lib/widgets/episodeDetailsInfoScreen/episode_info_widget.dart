import 'package:flutter/material.dart';

import '../../models/all_episodes_model.dart';
import '../widgets.dart';


class EpisodeInfo extends StatelessWidget {

  const EpisodeInfo({
    Key? key, required this.episode,
  }) : super(key: key);

  final Episode episode;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CharacterAtrributeAndValue(attribute: 'Name', value: episode.name, size: size),
          CharacterAtrributeAndValue(attribute: 'Air_date', value: episode.airDate, size: size),
          CharacterAtrributeAndValue(attribute: 'Episode', value: episode.episode, size: size),
        ],
      ),
    );
  }
}