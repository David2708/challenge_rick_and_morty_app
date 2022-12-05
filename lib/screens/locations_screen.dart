import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/locations_provider.dart';

import '../models/all_locations_model.dart';

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

        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'location', arguments: locations[index]),
              child: _InfoLocations(location: locations[index].name)
              ),
        ),

      )
    );
  }
}

class _InfoLocations extends StatelessWidget {

  const _InfoLocations({
    Key? key,
    required this.location,
  }) : super(key: key);

  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.symmetric( vertical: 10 ),
      decoration: _boxDecorationContainer(),
      child: Text(
        location, 
        style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold ),
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