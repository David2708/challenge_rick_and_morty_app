
import 'package:flutter/material.dart';


class SliderNameEpisodeos extends StatelessWidget {

  const SliderNameEpisodeos({
    required this.name,
    Key? key,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric( horizontal: 15, vertical: 5 ),
      margin: const EdgeInsets.symmetric( horizontal: 5 ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text( name ),
    );
  }
}