import 'package:carwashing/core/utils/app_assets.dart';
import 'package:carwashing/features/auth/widgets/custom_text_field.dart';
import 'package:carwashing/features/home/presentation/widgets/home_list_view.dart';
import 'package:carwashing/features/home/presentation/widgets/home_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 50.h,),),
        const  SliverToBoxAdapter(child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text('Hey Mark'),Icon(Icons.notifications)],),),
         const SliverToBoxAdapter(child: Text('A clean car is a '),),
          const SliverToBoxAdapter(child: Text('happy car ! '),),
          const SliverToBoxAdapter(child: HomeSearchBar(),),
          SliverToBoxAdapter(child: SizedBox(height: 50.h,),),
          const SliverToBoxAdapter(child: Text('services '),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child:HomeListView(),),
          SliverToBoxAdapter(child: SizedBox(height: 10.h,),),
          const SliverToBoxAdapter(child: Text('your appourtment '),),





          
        ],
      ),
    );
  }
}

class HomeContaner extends StatelessWidget {
  const HomeContaner({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}