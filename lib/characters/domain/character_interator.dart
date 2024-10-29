import 'package:app_flutter/characters/data/character_repository.dart';
import 'package:app_flutter/characters/data/services/character_response.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterInterator {
  Future<CharacterApiResponse> fetchCharacters(int page);
}


@Injectable(as: CharacterInterator)
class CharacterInteratorImpl implements CharacterInterator {
  const CharacterInteratorImpl(this._repository);

  final CharacterRepository _repository;

  @override
  Future<CharacterApiResponse> fetchCharacters(int page) => 
    _repository.getCharacters(page);
}