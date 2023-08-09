part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {
  const MainScreenEvent();
}

class ClickedMainScreenEvent extends MainScreenEvent {
  const ClickedMainScreenEvent();

  @override
  List<Object> get props => [];
}
