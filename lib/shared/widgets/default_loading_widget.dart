import 'package:flutter/material.dart';

class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 100, child: Center(
      child: CircularProgressIndicator(),
    ),);
  }
}