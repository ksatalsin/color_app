import 'package:color_app/l10n/l10n.dart';
import 'package:color_app/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenView extends StatelessWidget {
  const MainScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final background =
        context.select((MainScreenBloc bloc) => bloc.state).backgroundColor;
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          context.read<MainScreenBloc>().add(const ClickedMainScreenEvent());
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          color: background,
          child: const Center(
            child: _HelloText(),
          ),
        ),
      ),
    );
  }
}

class _HelloText extends StatelessWidget {
  const _HelloText();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final textColor =
        context.select((MainScreenBloc bloc) => bloc.state).textColor;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        l10n.welcomeText,
        style: theme.textTheme.displayLarge?.copyWith(color: textColor),
      ),
    );
  }
}
