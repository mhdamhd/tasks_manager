import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Define this class for all gradient that can be used in the application
/// You can define [Gradient] , [LinearGradient] in the following way:
///
/// static const LinearGradient gradientName = LinearGradient(
///     colors: [_gradentColors],
///     begin: Alignment.bottomCenter,
///     end: Alignment.bottomLeft,
///   );

class AppGradients {

  // TODO: customize your gradents
  static const LinearGradient gradientName = LinearGradient(
    colors: [AppColors.black, AppColors.white],
    begin: Alignment.bottomCenter,
    end: Alignment.bottomLeft,
  );

  static LinearGradient blueGradient = LinearGradient(
    colors: [AppColors.white.withOpacity(0.5), AppColors.blue1.withOpacity(0.5), AppColors.blue2.withOpacity(0.75), AppColors.blue3.withOpacity(0.5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient blue1Gradient =  LinearGradient(
    colors: [AppColors.blue1, AppColors.blue1],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient blue2Gradient =  LinearGradient(
    colors: [AppColors.blue5, AppColors.blue4],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient dialogGradient =  LinearGradient(
    colors: [AppColors.blue, AppColors.blue6],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );



  static LinearGradient whiteGradient = LinearGradient(
    colors: [AppColors.white1.withOpacity(0.4), AppColors.white1.withOpacity(0.1),],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient white1Gradient = LinearGradient(
    colors: [Colors.white, Colors.white.withOpacity(0.5), Colors.white.withOpacity(0)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient buttonGradient = LinearGradient(
    colors: [AppColors.blue1.withOpacity(0.5), AppColors.blue2.withOpacity(0.75), AppColors.blue3.withOpacity(0.5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient blackGradient = LinearGradient(
    colors: [AppColors.lightBlack.withOpacity(0.5), AppColors.lightBlack.withOpacity(0.75)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient redGradient = LinearGradient(
    colors: [AppColors.white1.withOpacity(0.4), AppColors.red.withOpacity(0.1),],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient red1Gradient = LinearGradient(
    colors: [Colors.white.withOpacity(0.5), Colors.white.withOpacity(0.5), AppColors.red1.withOpacity(0.2), AppColors.red2.withOpacity(0.5), AppColors.red3.withOpacity(0.6)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient yellowGradient = LinearGradient(
    colors: [AppColors.yellow3.withOpacity(0.2), AppColors.yellow5],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient yellow1Gradient = LinearGradient(
    colors: [Colors.white, AppColors.yellow5.withOpacity(0.6), AppColors.yellow6.withOpacity(0.5)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient yellow2Gradient = const LinearGradient(
    colors: [AppColors.white3, AppColors.yellow8],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

}
