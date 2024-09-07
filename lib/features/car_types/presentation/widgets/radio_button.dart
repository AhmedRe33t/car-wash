
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    super.key, required this.model, required this.index,
  });
 final CartypeModel model;
 final int index;

  @override
  State<RadioButton> createState() => _RadioButtonState();
}


class _RadioButtonState extends State<RadioButton> {
  
  int selected=-1;

  // customRadio(IconData icon,CartypeModel model,int index){
  //   return Padding(
  //     padding:  EdgeInsets.symmetric(horizontal: 16.w),
  //     child: OutlinedButton(
  //         style: ButtonStyle(
  //           backgroundColor: WidgetStatePropertyAll(selected?AppColors.amperColor:AppColors.greyColor)
  //         ),
                     
  //        onPressed: () {  
  //         setState(() {
  //           selected=!selected;
  //         });
  //        },
  //        child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //         SizedBox(width: 10.w,),
  //         Text(widget.model.name),
  //         SizedBox(
  //         height: 80.h,
  //         width: 100.w,
  //         child: Align(
  //           alignment: AlignmentDirectional.centerEnd,
  //           child: CachedNetworkImage(
  //             imageUrl: widget.model.image,
  //             placeholder: (context, url) => Shimmer.fromColors(
  //               baseColor: AppColors.greyColor,
  //               highlightColor: Colors.white,
  //               child: Container(
  //                 width: 47,
  //                 height: 64,
  //                 color: AppColors.greyColor,
  //               ),
  //             ),
  //             errorWidget: (context, url, error) => const Icon(Icons.error),
  //           ),
  //         ),
  //                ),
                 
                 
  //        ],),
        
  //        ),
  //   );
  // }
 
  @override
   
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w),
      child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll( selected==widget.index?AppColors.amperColor:AppColors.greyColor)
          ),
                     
         onPressed: () {  
          setState(() {
            selected=widget.index;
          });
          // selected=0;
         },
         child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          SizedBox(width: 10.w,),
          Text(widget.model.name),
          SizedBox(
          height: 80.h,
          width: 100.w,
          child: Align(
            alignment: AlignmentDirectional.centerEnd,
            child: CachedNetworkImage(
              imageUrl: widget.model.image,
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
    );
  }
}
