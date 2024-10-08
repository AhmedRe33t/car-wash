import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/splash/presentation/widgets/custom_splash_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
               backgroundColor: AppColors.primaryColor,
               body: Padding(
                 padding:const EdgeInsets.symmetric(horizontal: 16.0),
                 child: CustomScrollView(
                     slivers: [
                      SliverToBoxAdapter(child: SizedBox(height: 140.h,),),
                      SliverToBoxAdapter(child: Text('Experience the',style: CustomTextStyle.pacifico600style24,) ,),
                      SliverToBoxAdapter(child:Text('Ultimate Car',style: CustomTextStyle.pacifico600style24.copyWith(color: AppColors.deepAmperColor),) ,),
                      SliverToBoxAdapter(child:Text('Wash',style: CustomTextStyle.pacifico600style24.copyWith(color: AppColors.deepAmperColor),) ,),
                      SliverToBoxAdapter(child: SizedBox(height: 50.h,),),
                      const SliverToBoxAdapter(child: CustomSplashImage(),),
                      SliverToBoxAdapter(child: SizedBox(height: 100.h,),),
                       SliverToBoxAdapter(child: CustomBtn(text: 'Get Started ',color: AppColors.amperColor,onPressed: () {
                        customNavigaeReplacement(context, path: '/signInView');
                      },),),
                      

                      
                     ],
                 )
                 
                 
                 
               
               ),
    );
  }
}
