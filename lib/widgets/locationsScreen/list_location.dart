import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../widgets.dart';


class ListLocations extends StatefulWidget {
  
  const ListLocations({super.key, required this.locations, required this.onNextPage});

  final List<Location> locations;
  final onNextPage;

  @override
  State<ListLocations> createState() => _ListLocationsState();
}


class _ListLocationsState extends State<ListLocations> {

  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 200){
        widget.onNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.locations.isEmpty
            ? const Center(child: CircularProgressIndicator(color: Colors.grey),)
            : ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: widget.locations.length,
                itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'location', arguments: widget.locations[index]),
                child: InformationNameWidget(name: widget.locations[index].name)
              ),
      );
  }
}