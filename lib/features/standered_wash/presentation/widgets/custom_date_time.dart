import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CustomDateAndTime extends StatefulWidget {
  const CustomDateAndTime({super.key});

  @override
  State<CustomDateAndTime> createState() => _CustomDateAndTimeState();
}

class _CustomDateAndTimeState extends State<CustomDateAndTime> {
    
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller:context.read<DateTimeCubit>().timePicker,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
               ),
               labelText: 'pick your Time',
               labelStyle: const TextStyle(
                fontSize: 14,
                color: Colors.amber
               )
       
            ),
            onTap: ()async{
              var time=await showTimePicker(context: context, initialTime: TimeOfDay.now());
              if(time!=null){
                setState(() {
                 context.read<DateTimeCubit>(). timePicker.text=time.format(context);
                });
              }
            },
          ),
          SizedBox(height: 20.h,),
          TextField(
            controller:context.read<DateTimeCubit>(). datePicker,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(30),
               ),
               labelText: 'pick your Date',
               labelStyle: const TextStyle(
                fontSize: 14,
                color: Colors.amber
               )
      
            ),
            onTap: ()async{
              DateTime? dateTime= await showDatePicker(context: context, initialDate: DateTime.now(),
              firstDate: DateTime(1990), lastDate: DateTime(2100));
              if(dateTime!=null){
                String formattedDate= DateFormat('yyyy-MM-dd').format(dateTime);
                setState(() {
                 context.read<DateTimeCubit>(). datePicker.text=formattedDate;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}