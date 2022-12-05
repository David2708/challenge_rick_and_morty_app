import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_app/providers/episodes_provider.dart';
import 'package:rick_and_morty_app/providers/locations_provider.dart';
import 'package:rick_and_morty_app/screens/episode_detils_info.dart';

import 'providers/characters_provider.dart';
import 'screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider()),
        ChangeNotifierProvider(create: (_) => LocationsProvider()),
        ChangeNotifierProvider(create: (_) => EpisodesProvider()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Material App',
      home: const HomeScreen(),
      theme: ThemeData.dark(),
      routes: {
        'characters' :(context) => const CharactersScreen(),
        'locations' :(context) => const LocationsScreen(),
        'episodes' :(context) => const EpisodesScreen(),
        
        'character' :(context) => const CharacterDetailInfoScreen(),
        'location' :(context) => const LocationDetailInfoScreen(),
        'episode' :(context) => const EpisodeDetailsInfoScreen(),
      },
    );
  }
}