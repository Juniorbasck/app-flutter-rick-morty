import 'package:equatable/equatable.dart';

class CharacterInfoResponse extends Equatable{

  final int? count;
  final int? pages; 
  final String? next;
  final String? prev;

 factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) =>
    CharacterInfoResponse(
      count: json['count'] as int?,
      pages: json['pages'] as int?,
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );
  
  const CharacterInfoResponse({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  @override
  List<Object?> get props => [count, pages, next, prev];
}

class CharacterResponse extends Equatable{

  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
    CharacterResponse(
      json['id'] as int,
      json['name'] as String,
      json['status'] as String,
      json['species'] as String,
      json['type'] as String,
      json['image'] as String,
    );

  const CharacterResponse(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.image
  );
  
  @override
  List<Object> get props => [id, name, status, species, type, image];
}

class CharacterApiResponse extends Equatable{
  
  final CharacterInfoResponse info;
  final List<CharacterResponse> results;

  const CharacterApiResponse(this.info, this.results);

  factory CharacterApiResponse.fromJson(Map<String, dynamic> json) =>
    CharacterApiResponse(
        CharacterInfoResponse.fromJson(json['info']),
        (json['results'] as List<dynamic>)
        .map((CharacterJson) => CharacterResponse.fromJson(CharacterJson))
        .toList(),
    );

  @override
  List<Object> get props => [info, results];
}