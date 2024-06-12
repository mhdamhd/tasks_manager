import 'package:flutter/material.dart';

/// Define this class for all colors that can be used in the application
/// You can define [Color] in the following way:
///
/// static const Color colorName = Color(colorHex);
///
///
/// You can also define [MaterialColor] in the same class in the following way:
///
/// static const MaterialColor materialColor = MaterialColor(
///     colorHex,
///     <int, Color>{
///       50: Color(colorHex50),
///       100: Color(colorHex100),
///       200: Color(colorHex200),
///       300: Color(colorHex300),
///       400: Color(colorHex400),
///       500: Color(colorHex500),
///       600: Color(colorHex600),
///       700: Color(colorHex700),
///       800: Color(colorHex800),
///       900: Color(colorHex900),
///     },
///   );

class AppColors {

  // TODO: customize your Colors
  static const Color green = Color(0xFF4CAF50);
  static const Color green1 = Color(0xFF32CF38);
  static const Color darkGrey = Color(0xFFB1B1B1);
  static const Color lightGrey = Color(0xFFCFCFD0);
  static const Color lightBlack = Color(0xFF2B2B2B);
  static const Color greyAccent = Color(0xFFF5F5F5);
  static const Color black = Color(0xFF333333);
  static const Color black1 = Color(0xFF242424);
  static const Color black2 = Color(0xFF303030);

  static const Color blue = Color(0xFF4152A4);
  static const Color lightBlue = Color(0xFF506AEC);

  static const Color yellow = Color(0xFFFDB137);
  static const Color yellow2 = Color(0xFFF0B61A);
  static const Color yellow3 = Color(0xFFF8E1A6);
  static const Color yellow5 = Color(0xFF705306);
  static const Color yellow6 = Color(0xFFF7DB92);
  static const Color yellow7 = Color(0xFFF0BC31);
  static const Color yellow8 = Color(0xFFF0B61A);
  static const Color orange = Color(0xFFF36648);
  static const Color red = Color(0xFFB70000);
  static const Color red1 = Color(0xFF610000);
  static const Color red2 = Color(0xFF570000);
  static const Color red3 = Color(0xFF4D0000);
  static const Color red4 = Color(0xFFC24C4C);
  static const Color grey = Color(0xFF9D9FA0);
  static const Color grey1 = Color(0xFFB9B9B9);
  static const Color grey2 = Color(0xFF8E8E8E);
  static const Color white = Color(0xFFFFFFFF);

  static const Color blue1 = Color(0xFF003861);
  static const Color blue2 = Color(0xFF003157);
  static const Color blue3 = Color(0xFF00294D);
  static const Color blue4 = Color(0xFF08175F);
  static const Color blue5 = Color(0xFF4E65D2);
  static const Color blue6 = Color(0xFF1C2964);

  static const Color white1 = Color(0xFFF0F0F0);
  static const Color white2 = Color(0xFFF7EFE4);
  static const Color white3 = Color(0xFFEBEBEB);

  static Color get primary => blue;
  static Color get secondary => yellow;
  static Color get tertiary => red;

  static const MaterialColor materialColor = MaterialColor(
    0X00000000,
    <int, Color>{
      50: Color(0X00000000),
      100: Color(0X00000000),
      200: Color(0X00000000),
      300: Color(0X00000000),
      400: Color(0X00000000),
      500: Color(0X00000000),
      600: Color(0X00000000),
      700: Color(0X00000000),
      800: Color(0X00000000),
      900: Color(0X00000000),
    },
  );
}
