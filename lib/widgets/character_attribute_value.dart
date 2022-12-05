import 'package:flutter/material.dart';

class CharacterAtrributeAndValue extends StatelessWidget {

  const CharacterAtrributeAndValue({
    Key? key, required this.attribute, required this.value, required this.size,
  }) : super(key: key);

  final String attribute;
  final String value;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only( bottom: 20 ),
      child: Row(
        children: [
          SizedBox(
            width: size.width*0.45 - 20,
            child: Text(attribute, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),),
          ),


          SizedBox(
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: size.width*0.55 - 20),
                  child: Text(value, style: const TextStyle( fontSize: 15 )))
              ],
            ),
          ),

        ],
      ),
    );
  }
}