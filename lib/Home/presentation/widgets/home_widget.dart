import 'package:app_flutter/Home/presentation/cubit/navigation_cubit.dart';
import 'package:app_flutter/characters/presentation/page/character_page.dart';
import 'package:app_flutter/setting/page/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final _pages = {
      const CharacterPage()
      : const BottomNavigationBarItem(
        icon: Icon(Icons.person), 
        label: ('Characters'),
        ),
        const SettingPage()
        : const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ('Settings')
          )
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(
            index: state,
            children: _pages.keys.toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: _pages.values.toList(),
            currentIndex: state,
            // ignore: lines_longer_than_80_chars
            onTap: (value) => context.read<NavigationCubit>().onSelectedTab(value),
          ),
        );
      },
    );
  }
}