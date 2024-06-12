import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tasksmanager/core/constants/app_colors.dart';
import 'package:tasksmanager/core/extensions/theme_extensions/text_theme_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double height;
  final bool withBack;

  const CustomAppBar(
      {super.key,
      this.titleText,
      this.title,
      this.actions,
      this.bottom,
      this.height = kToolbarHeight,
      this.withBack = false})
      : assert(title != null || titleText != null);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? Text(titleText!, style: context.f16400),
      backgroundColor: AppColors.blue1,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.25),
      actions: actions,
      bottom: bottom,
      leading: withBack ? IconButton(
        padding: const EdgeInsetsDirectional.only(start: 20),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => context.pop()) : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
