import 'package:app_flutter/Home/presentation/page/home_page.dart';
import 'package:app_flutter/injection.dart';
import 'package:app_flutter/shared/theme/aplication_theme.dart';
import 'package:app_flutter/shared/theme/data/app_theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const RickAndMortyApp());
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AplicationTheme.themes[AppTheme.dark]?.themeData,
      home: const HomePage(),
    );
  }
}

