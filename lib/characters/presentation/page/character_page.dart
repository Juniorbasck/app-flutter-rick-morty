import 'package:app_flutter/characters/presentation/bloc/character_bloc.dart';
import 'package:app_flutter/characters/presentation/widgets/character_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterBloc>()..add(CharacterResquestEvent()),
      child: const CharacterWidget(),
    );
  }
}