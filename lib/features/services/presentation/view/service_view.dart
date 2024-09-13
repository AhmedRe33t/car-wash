import 'package:carwashing/core/functions/navigation.dart';
import 'package:carwashing/core/widgets/custom_btn.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_cubit.dart';
import 'package:carwashing/features/services/presentation/cubit/service/service_state.dart';
import 'package:carwashing/features/services/presentation/widgets/service_header.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServicesView extends StatelessWidget {

  Map<String,String> Prices = {
    'Standard Wash': '\$10',
    'Deluxe Wash': '\$20',
    'Premium Wash': '\$30',
  };

  ServicesView({super.key});
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            slivers: [
            const  SliverToBoxAdapter(child: ServiceHeader(),),
                            SliverToBoxAdapter(child: SizedBox(height: 30.h,),),

              SliverToBoxAdapter(
                child: _buildServiceCard(context, 'Standard Wash', Prices['Standard Wash'].toString(), Icons.local_car_wash, [
                  'Exterior wash',
                  'Tyre cleaning',
                  'Vacuuming',
                  'Hand drying'
                ],
                Colors.teal
                ),
                
              ),
                                          SliverToBoxAdapter(child: SizedBox(height: 5.h,),),

              SliverToBoxAdapter(
                child: _buildServiceCard(context, 'Deluxe Wash', Prices['Deluxe Wash'].toString(), Icons.card_membership, [
                  'Standard wash',
                  'Engine detailing',
                  'Tyre cleaning',
                  'Hand washing'
                ],
                 Colors.red
                             
                ),
              ),
                                          SliverToBoxAdapter(child: SizedBox(height: 5.h,),),
             
              SliverToBoxAdapter(
                child: _buildServiceCard(context, 'Premium Wash', Prices['Premium Wash'].toString(),Icons.fort, [
                  'Deluxe wash',
                  'Deep cleaning',
                  'Full detailing',
                  'Headlight cleaning'
                ],
                Colors.deepOrangeAccent
                ),
              ),
               
              SliverToBoxAdapter(child: SizedBox(height: 100.h,),),
             SliverToBoxAdapter( child:  BlocBuilder<ServiceCubit, ServiceState>(
               builder: (context, state) {
                bool isServiceSelected = state is ServiceSelected;
                 return CustomBtn(text:isServiceSelected? 'Book Now':'select your service',onPressed: () {
                  isServiceSelected?
                            customNavigaeReplacement(context, path: '/datetimeview',/*param1: state.selectedService*/):null;
                          },);
               },
             ) ,),
             
             
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(
      BuildContext context, String serviceName, String price, IconData icon, List<String> points,Color color) {
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        bool isSelected = state is ServiceSelected && state.selectedService == serviceName;
        return GestureDetector(
          onTap: () {
            context.read<ServiceCubit>().selectService(serviceName);
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: isSelected ? BorderSide(color: Colors.blue, width: 2.0.w) : BorderSide.none,
              borderRadius: BorderRadius.circular(10.w),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, size: 40.w,color: color,),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(serviceName, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: Container(), // Spacer
                            ),
                            // The price and radio button should be in a separate row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(price, style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
                                SizedBox(width: 8.w),
                                Radio<String>(
                                  value: serviceName,
                                  groupValue: state is ServiceSelected ? state.selectedService : null,
                                  onChanged: (value) {
                                    context.read<ServiceCubit>().selectService(value!);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: points.sublist(0, 2).map(_buildPointIconText).toList(),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Column(
                                
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: points.sublist(2, 4).map(_buildPointIconText).toList(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildPointIconText(String text) {
    return Row(
      children: [
        Icon(Icons.check_circle, size: 16.sp, color: Colors.green),
        SizedBox(width: 5.w),
        Expanded(child: Text(text, style: TextStyle(fontSize: 12.sp))),
      ],
    );
  }
}
