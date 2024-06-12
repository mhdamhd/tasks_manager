import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tasksmanager/core/constants/app_colors.dart';
import 'package:tasksmanager/core/constants/app_gradient.dart';
import 'package:tasksmanager/core/extensions/theme_extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final Widget? child;
  final String? text;
  final double? fontSize;
  final AppButtonType type;
  final bool loading;

  late final Color? color;
  late final Gradient? gradient;
  late final Gradient? borderGradient;
  late final BorderRadiusGeometry borderRadius;
  late final Color? primaryColor;
  late final TextStyle? textStyle;
  late final EdgeInsets padding;
  late final Border? border;

  AppButton(
      {Key? key,
      required this.onPressed,
      this.child,
      this.width,
      this.height,
      this.text,
      this.fontSize,
      this.type = AppButtonType.solidBlue,
      this.loading = false})
      : super(key: key) {
    color = switch (type) {
      AppButtonType.solidBlue => AppColors.blue,
      AppButtonType.solidYellow => AppColors.yellow,
      AppButtonType.transparentYellow => Colors.transparent,
      AppButtonType.solidRed => AppColors.red4,
      _ => null
    };

    gradient = switch (type) {
      AppButtonType.gradientBlue => AppGradients.buttonGradient,
      AppButtonType.gradientYellow => AppGradients.yellowGradient,
      _ => null
    };

    borderGradient = switch (type) {
      AppButtonType.gradientYellow => AppGradients.yellow1Gradient,
      _ => null
    };

    borderRadius = switch (type) {
      AppButtonType.gradientYellow => BorderRadius.circular(20),
      AppButtonType.solidYellow || AppButtonType.transparentYellow => BorderRadius.circular(8),
      _ => BorderRadius.circular(10)
    };

    primaryColor = switch (type) {
      AppButtonType.solidRed => AppColors.red,
      AppButtonType.gradientYellow || AppButtonType.solidYellow || AppButtonType.transparentYellow  => AppColors.yellow,
      _ => AppColors.blue
    };

    padding = switch (type) {
      AppButtonType.gradientYellow =>
        EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.w),
      _ => EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w)
    };

    border = switch (type) {
      AppButtonType.transparentYellow =>
        Border.all(color: AppColors.yellow),
      _ => null
    };
  }

  @override
  Widget build(BuildContext context) {
    textStyle = switch (type) {
      AppButtonType.gradientBlue => context.f20700,
      AppButtonType.gradientYellow => context.f14600,
      AppButtonType.solidYellow => context.f16700,
      AppButtonType.transparentYellow => context.f16700?.copyWith(color: AppColors.yellow),
      _ => context.f16600
    };

    return Container(
    width: width,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        borderRadius: borderRadius,
        border: borderGradient == null
            ? border
            : GradientBoxBorder(
                gradient: borderGradient!,
                width: 1,
              ),
      ),
      padding: EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: loading ? null : onPressed,
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            backgroundColor: primaryColor,
            elevation: 0,
            foregroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
            padding: EdgeInsets.zero),
        child: Container(
          alignment: Alignment.center,
          padding: padding,
          child: loading
              ? const CircularProgressIndicator()
              : child ??
                  Text(
                    text ?? '',
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
        ),
      ),
    );
  }
}

enum AppButtonType {solidBlue, gradientBlue, solidRed, gradientYellow, solidYellow, transparentYellow}
