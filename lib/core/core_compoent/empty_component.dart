import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasksmanager/core/constants/app_colors.dart';
import 'package:tasksmanager/generated/l10n.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300.h),
        Icon(Icons.warning_amber, size: 100.w, color: AppColors.yellow,),
        SizedBox(height: 10.w),
        Text(S.of(context).noDataToShow,  style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}
