import 'package:app_flutter/characters/data/services/character_response.dart';
import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({
    super.key, 
    required this.response, 
    this.onTap,
  });

  final CharacterResponse response;
  final VoidCallback? onTap;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: theme.cardTheme.elevation ?? 00,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(response.image)
            ],
          ),

        ),
      ),
    );
  }
}