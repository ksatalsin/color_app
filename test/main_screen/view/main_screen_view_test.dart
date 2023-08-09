import 'package:color_app/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/helpers.dart';

void main() {
  final textColor = ColorUtils.getContrastColor(sourceColor: Colors.deepPurple);
  final bloc = MainScreenBloc(
    colorGenerator: () => Colors.deepPurple,
  );

  group('MainScreenView', () {
    testWidgets('renders', (WidgetTester tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: bloc,
          child: const MainScreenView(),
        ),
      );
      expect(find.byType(MainScreenView), findsOneWidget);
    });
  });

  group('HelloText', () {
    testWidgets('renders with the right text color',
        (WidgetTester tester) async {
      await tester.pumpApp(
        BlocProvider.value(
          value: bloc,
          child: const MainScreenView(),
        ),
      );
      await tester.tap(find.byType(MainScreenView));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      await tester.tap(find.byType(MainScreenView));
      await tester.pumpAndSettle(const Duration(milliseconds: 500));
      final helloText = find.text('Hey there');
      final color = tester.widget<Text>(helloText).style?.color;
      expect(color, equals(textColor));
    });
  });
}
