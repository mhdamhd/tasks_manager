/// The [LoadingComponent] class is a reusable widget that displays a loading indicator at the center of the screen.
/// It is typically used to indicate that content is being loaded or processed.

import 'package:flutter/material.dart';
import 'package:tasksmanager/core/constants/app_colors.dart';
import 'package:tasksmanager/core/extensions/theme_extensions/text_theme_extension.dart';

// TODO: customize Loading component view

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({Key? key}) : super(key: key);

  static void showProgressModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (ctx) => Container(
        decoration: const BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const LoadingComponent(),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Please Wait...",
                    style: context.f16700,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).viewInsets.bottom + 20.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(color: AppColors.secondary));
  }
}
