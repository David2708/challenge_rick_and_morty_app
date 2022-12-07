import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_and_morty_app/providers/locations_provider.dart';
import 'package:rick_and_morty_app/search/search_location.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class LocationsScreen extends StatelessWidget {
   
  const LocationsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final locationsProvider = Provider.of<LocationsProvider>(context);

    List<Location> locations = locationsProvider.locations;
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text( 'Locations' ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: SearchLocationDelegate()),
          )
        ],
      ),
      body: Stack(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20 ),
            child: ListLocations(locations: locations, onNextPage: locationsProvider.getAllLocations,)
          ),

          if(locationsProvider.getIsloading() && locationsProvider.getMakeRequest())
            const LoadingData(),
            
        ],
      )
    );
  }
}

