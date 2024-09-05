import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Setting_item_listtile extends StatelessWidget {
  const Setting_item_listtile({super.key, required this.icon, required this.title, required this.color});
 final Icon icon;
 final String title;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: 16.h),
      child: ListTile
            (
              onTap: (){},
              leading:Container
              (
                height: 50.h,
                width: 50.w,
                child: Icon(icon.icon,color: AppColors.whiteColor,),
                decoration: BoxDecoration
                (
                  color:color ,
                  borderRadius: BorderRadius.circular(30.w)
                ),
              ) ,
              title: Text(title,style: CustomTextStyle.poppins500style18.copyWith
              (
                color: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),),
            ),
    );
  }
}