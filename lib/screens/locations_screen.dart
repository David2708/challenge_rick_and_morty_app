import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/locations_provider.dart';

import '../models/all_locations_model.dart';
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
      ),
      body: Padding(

        padding: const EdgeInsets.symmetric( horizontal: 20 ),

        child: locations.isEmpty
            ? const Center(child: CircularProgressIndicator(color: Colors.grey),)
            : ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'location', arguments: locations[index]),
              child: InformationNameWidget(name: locations[index].name)
              ),
        ),

      )
    );
  }
}

