import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';

class EpisodeBuilder extends StatefulWidget {
  
  const EpisodeBuilder({super.key, required this.episodes, required this.onNexPage});

  final List<Episode> episodes;
  final onNexPage;

  @override
  State<EpisodeBuilder> createState() => _EpisodeBuilderState();
}

class _EpisodeBuilderState extends State<EpisodeBuilder> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        widget.onNexPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.episodes.isEmpty
          ? const Center(child: CircularProgressIndicator(color: Colors.grey))
          : ListView.builder(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            itemCount: widget.episodes.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'episode', arguments: widget.episodes[index]) ,
              child: InformationNameWidget(name: widget.episodes[index].name,),
            ),
      );
  }
}