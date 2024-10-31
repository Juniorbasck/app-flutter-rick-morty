import 'package:app_flutter/shared/theme/data/app_theme_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<String> {
  ThemeCubit(this._repository) : super(_repository.theme ?? '');

  final AppThemeRepository _repository;

  void changeTheme(String theme) {
    _repository.changeTheme(theme);
    emit(theme);
  }
}
