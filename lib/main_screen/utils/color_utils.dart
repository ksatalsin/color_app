import 'dart:math';
import 'dart:ui';

/// Default dark color used for contrast when the source color is bright.
const kDefaultDarkColor = Color(0xFF141414);

/// Default bright color used for contrast when the source color is dark.
const kDefaultBrightColor = Color(0xffc8c8c8);

/// {@template color_}
/// A utility class for working with colors.
class ColorUtils {
  /// The size of the color range.
  static const kColorSize = 255;

  /// Half of the color size, used for calculating middle colors.
  /// Variable based on visual perception.
  static const kHalfColorSize = 126;

  /// Generates random red, green, and blue and returns [Color].
  static Color generateColor() {
    final random = Random();
    return Color.fromARGB(
      kColorSize,
      random.nextInt(kColorSize),
      random.nextInt(kColorSize),
      random.nextInt(kColorSize),
    );
  }

  /// Determines the contrast of the source color
  /// and returns [kDefaultDarkColor]
  /// or [kDefaultBrightColor].
  static Color getContrastColor({required Color sourceColor}) {
    return sourceColor.isBright() ? kDefaultDarkColor : kDefaultBrightColor;
  }
}

/// Extension on the [Color]
extension ColorX on Color {
  /// isBright luminance converter to boolean.
  bool isBright() {
    return computeLuminance() > 0.4;
  }
}
