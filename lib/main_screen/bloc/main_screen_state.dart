part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  const MainScreenState({
    required this.backgroundColor,
    required this.textColor,
  });

  final Color backgroundColor;
  final Color textColor;

  @override
  List<Object?> get props => [backgroundColor, textColor];

  MainScreenState copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return MainScreenState(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }
}
