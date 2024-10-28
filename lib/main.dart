import 'package:app_flutter/characters/data/services/character_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  const MyHomePage({super.key});

  Widget build(BuildContext context){
    return Center(
      child: TextButton(
        onPressed: () {
          final CharacterService service = CharacterServiceImpl(http.Client());
          service.getCharacter();
        },
        child: const Text('click here'),
      ),
    );
  }
} 
