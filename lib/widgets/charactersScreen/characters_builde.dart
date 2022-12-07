import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';

class CharacterBuilder extends StatefulWidget {

  const CharacterBuilder({super.key, required this.characters, required this.onNextPage});

  final List<Character> characters;
  final onNextPage;

  @override
  State<CharacterBuilder> createState() => CharacterBuilderState();
}


class CharacterBuilderState extends State<CharacterBuilder> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 

      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200){
        widget.onNextPage();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return  widget.characters.isEmpty
              ? const Center(child: CircularProgressIndicator(color: Colors.grey),)
              : ListView.builder(
              physics:  const BouncingScrollPhysics(),
              controller: scrollController,
              itemCount: widget.characters.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'character', arguments: widget.characters[index]),
                child: CharacterInfoGeneral(character: widget.characters[index]),
              ),
    );
  }
}