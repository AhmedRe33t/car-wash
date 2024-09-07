import 'package:cached_network_image/cached_network_image.dart';
import 'package:carwashing/core/functions/custom_toast.dart';
import 'package:carwashing/core/utils/app_colors.dart';
import 'package:carwashing/core/utils/app_text_style.dart';
import 'package:carwashing/core/widgets/custom_shimmer_category.dart';
import 'package:carwashing/features/car_types/cubit/car_types_cubit.dart';
import 'package:carwashing/features/car_types/cubit/car_types_state.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:carwashing/features/car_types/presentation/widgets/discriptions.dart';
import 'package:carwashing/features/car_types/presentation/widgets/radio_button.dart';
import 'package:carwashing/features/car_types/presentation/widgets/sign_up_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CarTypesView extends StatelessWidget {
  const CarTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: CustomScrollView(
      slivers: [
       const SliverToBoxAdapter(child: CarTypesTitle(),),
         SliverToBoxAdapter(child: SizedBox(height: 10.h,) ,),
        const  SliverToBoxAdapter(child: CustomDiscrertionsCarTypes(),),
       const SliverToBoxAdapter(child: CarListView(),)

            
      ],
     ),
    );
  }
}

class CarListView extends StatelessWidget {
  const CarListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CarTypesCubit, CarTypesState>(
      listener: (context, state) {
       if(state is GetCarTypesFaluire){
        showToast(state.errorMassege);
       } 
      },
      builder: (context, state) {
        return  state is GetCarTypesLoading?const CustomShimmerCategory():  Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context,index)=>RadioButton(model:context.read<CarTypesCubit>().carTypes[index],index: index ,),
             separatorBuilder: (context,index)=>SizedBox(height: 6.h,),
             itemCount: context.read<CarTypesCubit>().carTypes.length),
        );
      },
    );
  }
}

