import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 100, 
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Ops! Something wrong happend', 
        style: Theme.of(context).textTheme.bodyMedium,),
        TextButton(onPressed: onPressed, child: const Text('Try Again'))
      ],
    ),
  );
}