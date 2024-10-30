import 'package:app_flutter/characters/data/services/character_response.dart';
import 'package:app_flutter/shared/widgets/cicle_widget.dart';
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
              Image.network(response.image),
              Expanded(
                child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 8.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          response.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            CicleWidget(
                              status: response.status.toLowerCase(),
                            ),
                            const SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  '${response.status} - ${response.species}',
                                  style: theme.textTheme.bodyMedium,
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 32,),

                        Text('Last location',
                         style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 12.0)
                        ),
                        const SizedBox(height: 8.0,),
                        Expanded(
                          child: Text(
                            response.location.name,
                            style: theme.textTheme.titleSmall,
                          )
                        )
                      ],
                    )
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
