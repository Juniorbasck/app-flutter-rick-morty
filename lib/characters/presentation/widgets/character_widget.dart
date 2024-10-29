import 'package:app_flutter/characters/presentation/bloc/character_bloc.dart';
import 'package:app_flutter/shared/widgets/default_try_again_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterWidget extends StatefulWidget {
  const CharacterWidget({super.key});

  @override
  State<CharacterWidget> createState() => _CharacterWidgetState();
}

class _CharacterWidgetState extends State<CharacterWidget> {
  
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScrollListener);
  }

  @override
  void dispose() {
    _scrollController
    ..removeListener(_onScrollListener)
    ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state.result == ResulState.initial ||
             state.result == ResulState.loading && 
             state.isFirstPage) ... {
              const Center(
                child: SizedBox(
                  height: 100,
                  child: CircularProgressIndicator(),
                ),
              )
            }else if (state.result == ResulState.error && state.isFirstPage) ... {
              Center(
                child: DefaultTryAgainWidget(onPressed: _requesCharacter,) ,
              )
            }else ...{
                ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemBuilder: (context, index){
                    if(index < state.characters.length){
                      return SizedBox(
                        height: 200,
                        child: Text(state.characters[index].name),
                    );
                  }else if(state.result == ResulState.error){
                    return DefaultTryAgainWidget(
                      onPressed: _requesCharacter
                    );
                  }else {
                    return const SizedBox(
                      height: 100,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                },

                itemCount: state.hashReachedMax
                 ? state.characters.length 
                 : state.characters.length + 1,
              )
            }
          ],
        );
      },
    );
  }

  void _requesCharacter() {
    context.read<CharacterBloc>().add(CharacterResquestEvent());
  }

  void _onScrollListener() {
  
    if (_isBottomReached 
      && context.read<CharacterBloc>().
      state.result != 
      ResulState.error) {
      
      _requesCharacter();
    }
  }

  bool get _isBottomReached{
  
    if (!_scrollController.hasClients) return false;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    return currentScroll >= (maxScroll * 0.9);
  }
}