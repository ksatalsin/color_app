import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:color_app/main_screen/utils/color_utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

//[MainScreenBloc] class responsible for managing the state of the main screen.
class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc({
    required this.colorGenerator,
  }) : super(
          const MainScreenState(
            backgroundColor: kDefaultDarkColor,
            textColor: kDefaultBrightColor,
          ),
        ) {
    on<ClickedMainScreenEvent>(_screenClicked);
  }

  // A function to generate colors.
  final Color Function() colorGenerator;

  FutureOr<void> _screenClicked(
    ClickedMainScreenEvent event,
    Emitter<MainScreenState> emit,
  ) {
    final color = colorGenerator();
    emit(
      state.copyWith(
        backgroundColor: color,
        textColor: ColorUtils.getContrastColor(sourceColor: color),
      ),
    );
  }
}
