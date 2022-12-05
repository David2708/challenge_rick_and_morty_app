import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/widgets/homeScreen/button_widget.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [

               Text('Ricl And Morty', style: TextStyle( fontSize: 30, fontWeight: FontWeight.bold ),),

              _ListButtons()

            ],
          ),
        ),
      )
    );
  }
}

class _ListButtons extends StatelessWidget {
  const _ListButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [

        ButtonWidget( name: 'Characters', route: 'characters'),
        ButtonWidget( name: 'Locations', route: 'characters' ),
        ButtonWidget( name: 'Episodes', route: 'characters' ),

      ],
    );
  }
}