import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeWidget extends StatelessWidget {
  HomeWidget({super.key});

  final _pages = {
    const Center(
      child: Text('Characters Page'),
      ): const BottomNavigationBarItem(
        icon: Icon(Icons.person), 
        label: ('Characters'),),
        const Center(
          child: Text('Settings Page'),
          ): const BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: ('Settings')
          )
  };

  @override
  Widget build(BuildContext context) {

  }   
}