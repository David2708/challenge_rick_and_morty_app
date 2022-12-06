
import 'package:flutter/material.dart';

import '../models/models.dart';
import '../widgets/widgets.dart';

class LocationDetailInfoScreen extends StatelessWidget {
   
  const LocationDetailInfoScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Location location =  ModalRoute.of(context)!.settings.arguments as Location;

    return Scaffold(
      body: SafeArea(
        child: Center(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 50),

              const Padding(
                padding:  EdgeInsets.only(left: 20),
                child:  Text('Location Info', style: TextStyle( fontSize: 30 , fontWeight: FontWeight.bold),),
              ),
              const SizedBox(height: 50),

              LocationInfo( location: location ),
              const SizedBox(height: 50),

              const Padding(
                padding: EdgeInsets.only( left: 20 ),
                child: Text('Residents', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 30),
              
              ResidentsByLocations(location: location)

            ],
           ),
        ),
      ),
    );
  }
}

