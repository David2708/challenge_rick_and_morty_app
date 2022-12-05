
import 'package:flutter/material.dart';

class InformationNameWidget extends StatelessWidget {

  const InformationNameWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 60,
      margin: const EdgeInsets.symmetric( vertical: 10 ),
      decoration: _boxDecorationContainer(),
      child: Text(
        name, 
        style: const TextStyle( fontSize: 16, fontWeight: FontWeight.bold ),
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,),
    );
  }

  BoxDecoration _boxDecorationContainer() {
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