import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key, required this.model,
  });
 final CartypeModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: SizedBox(
        width: 100.h,
        height: 80.h,
        child: RadioMenuButton(
          value: model.name,
           groupValue: model.name, 
           onChanged: (car){
           
           }, 
           style: ButtonStyle(shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            
           ),
           elevation:const WidgetStatePropertyAll(2),
           backgroundColor:const WidgetStatePropertyAll(Color.fromARGB(255, 202, 202, 202))),
           
           child: Row(
            
            children: [
            SizedBox(width: 10.w,),
            Text(model.name),
             SizedBox(width: 160.w,),
            SizedBox(
            height: 80.h,
            width: 100.w,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: model.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: AppColors.greyColor,
                  highlightColor: Colors.white,
                  child: Container(
                    width: 47,
                    height: 64,
                    color: AppColors.greyColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          
           ],),
           ),
           
      ),
    );
  }
}