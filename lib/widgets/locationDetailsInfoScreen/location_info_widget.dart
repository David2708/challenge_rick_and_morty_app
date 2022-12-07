

import 'package:flutter/material.dart';


import '../../models/models.dart';
import '../widgets.dart';


class LocationInfo extends StatelessWidget {

  const LocationInfo({
    Key? key, required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CharacterAtrributeAndValue(attribute: 'Name', value: location.name, size: size),
          CharacterAtrributeAndValue(attribute: 'Type', value: location.type, size: size),
          CharacterAtrributeAndValue(attribute: 'Dimension', value: location.dimension, size: size),
        ],
      ),
    );
  }
}