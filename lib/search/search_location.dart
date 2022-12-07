

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/all_locations_model.dart';
import '../providers/locations_provider.dart';
import '../widgets/widgets.dart';

class SearchLocationDelegate extends SearchDelegate{

  List<Location> locations = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () => query = ''
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null) ,
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    if(locations.isEmpty) return const NotFound();
    
    return ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) => _LocationItem( location: locations[index] )
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {

    if (query == '') return const EmptyContainer( icon: Icons.place_outlined );

    final locationProvider = Provider.of<LocationsProvider>(context, listen: false);
    locationProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: locationProvider.suggestionStream,
      builder: (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {

        if (!snapshot.hasData) return const EmptyContainer( icon: Icons.place_outlined );

        locations = snapshot.data!;

        if(locations.isEmpty) return const NotFound();

        return ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) => _LocationItem( location: locations[index] )
        );
      },
    );
  }


}

class _LocationItem extends StatelessWidget {

  const _LocationItem({
    Key? key, required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location.name),
      trailing: const Icon(Icons.arrow_right),
      onTap: () => Navigator.pushNamed(context, 'location', arguments: location),
    );
  }
}