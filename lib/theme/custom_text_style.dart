import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumBluegray800 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray800,
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumff5b2e4f => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF5B2E4F),
        fontWeight: FontWeight.w300,
      );
  static get bodyMediumff666666 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF666666),
      );
  // Inter text style
  static get interBlack900 => TextStyle(
        color: appTheme.black900,
        fontSize: 5.fSize,
        fontWeight: FontWeight.w500,
      ).inter;
  static get interBlack900Medium => TextStyle(
        color: appTheme.black900,
        fontSize: 2.fSize,
        fontWeight: FontWeight.w500,
      ).inter;
  // Label text style
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get labelLargePrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get labelLargeff0d2543 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF0D2543),
        fontWeight: FontWeight.w700,
      );
  static get labelLargeff33343d => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF33343D),
        fontWeight: FontWeight.w700,
      );
  static get labelLargeff999999 => theme.textTheme.labelLarge!.copyWith(
        color: Color(0XFF999999),
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}
