import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarTypesTitle extends StatelessWidget {
  const CarTypesTitle({super.key, });



  @override

  Widget build(BuildContext context) {
    return  Container(
              height: 200.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.r),
                  bottomRight: Radius.circular(10.r)

                )
              ),
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   SizedBox(height: 70.h,),
                    Text('Befor we statr!',style: CustomTextStyle.poppins600style24,),
                    
                     
                    
                  ],
                ),
              ),
              
         );
  }
}