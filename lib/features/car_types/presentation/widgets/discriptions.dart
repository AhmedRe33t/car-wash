import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDiscrertionsCarTypes extends StatelessWidget {
  const CustomDiscrertionsCarTypes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: Container(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text('Slect your car types so we can',style: CustomTextStyle.poppins500style18.copyWith(color: Colors.black),),
        Text('adjust our prices for you!',style: CustomTextStyle.poppins500style18.copyWith(color: Colors.black),),
        SizedBox(height: 20.h,),
        Text('Car type:',style: CustomTextStyle.poppins500style18.copyWith(color: AppColors.greyColor),)
        ],),),
    );
  }
}