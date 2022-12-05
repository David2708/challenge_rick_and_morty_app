import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  const ButtonWidget({super.key, required this.name, required this.route});

  final String name;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: const EdgeInsets.only(bottom: 20),
      child: TextButton(

        style: TextButton.styleFrom(
          backgroundColor: Colors.black54,
          foregroundColor: Colors.grey,
          minimumSize:  const Size( 200, 80 ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        
        onPressed: () => Navigator.pushNamed(context, route), 
        
        child: Text(
          name,
          style: const TextStyle( color: Colors.white, fontSize: 25 ),
        )),

    );
  }
}