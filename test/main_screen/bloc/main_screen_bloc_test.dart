import 'package:bloc_test/bloc_test.dart';
import 'package:color_app/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockColorUtils extends Mock implements ColorUtils {}

void main() {
  group('MainScreenBloc', () {
    late MainScreenBloc mainScreenBloc;
    const testColor = Color(0xFF754321);

    setUp(() {
      mainScreenBloc = MainScreenBloc(
        colorGenerator: () => testColor,
      );
    });

    tearDown(() {
      mainScreenBloc.close();
    });

    blocTest<MainScreenBloc, MainScreenState>(
      'emits correct state on ClickedMainScreenEvent',
      build: () => mainScreenBloc,
      act: (bloc) => bloc.add(const ClickedMainScreenEvent()),
      expect: () => [
        MainScreenState(
          backgroundColor: testColor,
          textColor: ColorUtils.getContrastColor(sourceColor: testColor),
        ),
      ],
    );
  });

  group('MainScreenEvent', () {
    test('props returns an empty list', () {
      expect(
        const ClickedMainScreenEvent(),
        equals(const ClickedMainScreenEvent()),
      );
    });

    test('props returns an empty list', () {
      const mainScreenEvent = ClickedMainScreenEvent();

      expect(mainScreenEvent.props, isEmpty);
    });
  });

  group('ClickedMainScreenEvent', () {
    test('props returns an empty list', () {
      const clickedMainScreenEvent = ClickedMainScreenEvent();

      expect(clickedMainScreenEvent, equals(const ClickedMainScreenEvent()));
    });
  });

  group('MainScreenState', () {
    test('copyWith parameters comparison', () {
      const initialScreenState = MainScreenState(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );

      final updatedScreenState = initialScreenState.copyWith(
        backgroundColor: Colors.red,
        textColor: Colors.black,
      );

      expect(updatedScreenState.backgroundColor, equals(Colors.red));
      expect(updatedScreenState.textColor, equals(Colors.black));
    });

    test('copyWith objects comparison', () {
      const initialScreenState = MainScreenState(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );

      expect(
        initialScreenState,
        isNot(
          equals(
            initialScreenState.copyWith(
              textColor: Colors.black,
              backgroundColor: Colors.black,
            ),
          ),
        ),
      );
    });

    test('copyWith returns the same instance if no values are provided', () {
      const initialScreenState = MainScreenState(
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );

      final sameScreenState = initialScreenState.copyWith();

      expect(sameScreenState, equals(initialScreenState));
    });

    test('props returns a list of background and text colors', () {
      const screenState = MainScreenState(
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );

      expect(
        screenState.props,
        equals([Colors.black, Colors.white]),
      );
    });
  });
}
