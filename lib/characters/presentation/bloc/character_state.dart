part of 'character_bloc.dart';

enum ResulState { 
  initial, 
  loading,
  error,
  result
}

class CharacterState extends Equatable {
  const CharacterState({
    this.page = 1,
    this.characters = const<CharacterResponse> [],
    this.hashReachedMax = false,
    this.result = ResulState.initial
  });
  
  final int page;
  final List<CharacterResponse> characters;
  final bool hashReachedMax;
  final ResulState result;

  @override
  List<Object> get props => [page, characters, hashReachedMax, result];

  bool get isFirstPage => page == 1;

  CharacterState copyWith({
    int? page,
    bool? hashReachedMax,
    List<CharacterResponse>? characters,
    ResulState? result
  }) =>   CharacterState(
      page: page ?? this.page,
      characters: characters ?? this.characters,
      hashReachedMax: hashReachedMax ?? this.hashReachedMax,
      result: result ?? this.result
    );
}

