import 'package:flutter/material.dart';

import '../../models/models.dart';

class StatusIndicator extends StatelessWidget {
  const StatusIndicator({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: character.status == 'Alive'
            ? Colors.green.shade600
            : character.status == 'Dead'
            ? Colors.red
            : Colors.black,
      ),
    );
  }
}