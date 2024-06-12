import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:tasksmanager/core/constants/app_gradient.dart';

class AppContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final Gradient? gradient;
  final Gradient? borderGradient;
  const AppContainer({Key? key, required this.child, this.margin, this.padding, this.width, this.gradient, this.borderGradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(horizontal: 30.w),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: gradient ?? AppGradients.whiteGradient,
        border: GradientBoxBorder(
          gradient: borderGradient ?? AppGradients.blueGradient,
          width: 2,
        ),
      ),
      width: width,
      child: child,
    );
  }
}
