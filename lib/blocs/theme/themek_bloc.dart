import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/themes/app_theme.dart';

part 'themek_event.dart';
part 'themek_state.dart';

class ThemekBloc extends Bloc<ThemekEvent, ThemekState> {
  ThemekBloc()
      : super(
            ThemekState(themeData: AppThemes.appThemData[AppTheme.lightTheme]));

  @override
  Stream<ThemekState> mapEventToState(ThemekEvent event) async* {
    try {
      if (event is ThemekEvent) {
        yield ThemekState(
          themeData: AppThemes.appThemData[event.appTheme],
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
