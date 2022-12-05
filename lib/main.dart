import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/characters_provider.dart';
import 'screens/screens.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersProvider())
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
        'character' :(context) => const CharacterDetailInfoScreen(),
      },
    );
  }
}