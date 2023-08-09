import 'package:color_app/main_screen/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ColorUtils', () {
    test('generateColor generates color', () {
      final color = ColorUtils.generateColor();
      expect(color, isA<Color>());
    });

    test('getContrastColor returns dark color', () {
      expect(
        ColorUtils.getContrastColor(sourceColor: Colors.white),
        kDefaultDarkColor,
      );
    });

    test('getContrastColor returns bright color', () {
      expect(
        ColorUtils.getContrastColor(sourceColor: Colors.black),
        kDefaultBrightColor,
      );
    });

    test('isBright is true for bright color', () {
      expect(Colors.white.isBright(), true);
    });

    test('isBright is false for dark color', () {
      expect(Colors.black.isBright(), false);
    });
  });
}
