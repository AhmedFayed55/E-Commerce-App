import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final int index;
  final String title;

  final bool isSelected;
  final Function onItemClick;

  const CategoryItem(
    this.index,
    this.title,
    this.isSelected,
    this.onItemClick, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Handle item click by calling onItemClick callback
    return InkWell(
      onTap: () => onItemClick(index),
      child: Container(
        // Set background color based on selection
        color: isSelected ? ColorManager.white : Colors.transparent,
        padding: REdgeInsets.all(AppPadding.p8),
        child: Row(
          children: [
            //Show/hide the indicator based on selection
            Visibility(
              visible: isSelected,
              child: Container(
                width: AppSize.s8.w,
                height: AppSize.s60.h,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: BorderRadius.circular(AppSize.s100),
                ),
              ),
            ),
            // wrap the text with expanded to avoid overflow error
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.p16.h,
                  horizontal: AppPadding.p8.w,
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style: getMediumStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
