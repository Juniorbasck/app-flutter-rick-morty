import 'dart:async';

import 'package:app_flutter/characters/data/services/character_response.dart';
import 'package:app_flutter/characters/domain/character_interator.dart';
import 'package:app_flutter/shared/event_transformation.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


part 'character_event.dart';
part 'character_state.dart';

@injectable
class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc(this._interator) : super(const CharacterState()) {
    on<CharacterResquestEvent>(_onCharacterResquestEvent, 
        transformer: throttleDroppable(const Duration(milliseconds: 100),
      ),
    );
  }

  final CharacterInterator _interator; 

  Future<void> _onCharacterResquestEvent(
    CharacterResquestEvent event, 
    Emitter<CharacterState> emit, 
  ) async {

    if (state.hashReachedMax) return;

    emit(state.copyWith(result: ResulState.loading));

    try{
      final response = await _interator.fetchCharacters(state.page);   

      emit(state.copyWith(
        page: state.page + 1,
        characters: List.of(state.characters)..addAll(response.results),
        hashReachedMax: state.page >= (response.info.pages ?? 1),
        // result: ResulState.result
      ));

    }catch(_){
      emit(state.copyWith(result: ResulState.error));
    }
  }
}
