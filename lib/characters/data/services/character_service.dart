import 'package:app_flutter/characters/data/services/character_response.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class CharacterService {
  Future<CharacterApiResponse> getCharacter([int page = 1]);
}

@Injectable(as: CharacterService)
class CharacterServiceImpl implements CharacterService {
  
  const CharacterServiceImpl(this._client);

  final Dio _client;
 
  @override
  Future<CharacterApiResponse> getCharacter([int page = 1]) async{
    final response = await _client.get(
      'character', 
      queryParameters: {'page': page},
    );  

    if (response.statusCode == 200) {
      return CharacterApiResponse.fromJson(response.data);
    } 

    throw Exception('Failed to load character');
  }
}