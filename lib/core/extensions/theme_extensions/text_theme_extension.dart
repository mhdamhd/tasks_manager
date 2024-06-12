import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? get displayLarge => textTheme.displayLarge;

  TextStyle? get displayMedium => textTheme.displayMedium;

  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get labelLarge => textTheme.labelLarge;

  TextStyle? get labelMedium => textTheme.labelMedium;

  TextStyle? get labelSmall => textTheme.labelSmall;

  TextStyle? get titleLarge => textTheme.titleLarge;

  TextStyle? get titleMedium => textTheme.titleMedium;

  TextStyle? get titleSmall => textTheme.titleSmall;

  TextStyle? get bodyLarge => textTheme.bodyLarge;

  TextStyle? get bodyMedium => textTheme.bodyMedium;

  TextStyle? get bodySmall => textTheme.bodySmall;

  TextStyle? get f30700 => textTheme.displayLarge;

  TextStyle? get f20700 => textTheme.displayMedium;

  TextStyle? get f18600 => textTheme.displaySmall;

  TextStyle? get f18700 => textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get f12600 => textTheme.labelLarge;

  TextStyle? get f12700 => textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get f10500 => textTheme.labelMedium;

  TextStyle? get f10600 => textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get f8500 => textTheme.labelSmall;

  TextStyle? get f8600 => textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get f16400 => textTheme.titleLarge;

  TextStyle? get f14400 => textTheme.titleMedium;

  TextStyle? get f14500 => textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500);

  TextStyle? get f14600 => textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600);

  TextStyle? get f14700 => textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get f8400 => textTheme.titleSmall;

  TextStyle? get f16600 => textTheme.bodyLarge;

  TextStyle? get f16700 => textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700);

  TextStyle? get f12400 => textTheme.bodyMedium;

  TextStyle? get f10400 => textTheme.bodySmall;
}