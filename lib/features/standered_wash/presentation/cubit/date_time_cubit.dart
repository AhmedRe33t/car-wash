

import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_state.dart';
import 'package:carwashing/features/standered_wash/presentation/model/date_time_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeCubit() : super(DateTimeInitial());
  // TextEditingController timePicker=TextEditingController();

  //    TextEditingController datePicker=TextEditingController();
     List<DateAndTime> dateTimeData=[];

     addDateAndTime({required String  datePicker, required String timePicker} )async{
      emit(AddDateAndTimeLoading());
      try {
        dateTimeData=[];
  await FirebaseFirestore.instance.collection('DateTime').add({
    'date':datePicker,
    'time':timePicker
   });
      emit(AddDateAndTimeSuccess());

} on Exception catch (e) {
  emit(AddDateAndTimeFaluire(errorMassage: e.toString()));
}
     }
  
    getDateAndTime()async{
      emit(GeyDateAndTimeLoadint());
      try {
    dateTimeData=[];
  await FirebaseFirestore.instance.collection('DateTime').get().then((value){
    for (var elemnt in value.docs) {
       dateTimeData.add(DateAndTime.fromJson(elemnt.data()));
       emit(GetDateAndTimeSuccess());
    }
  

  });
} on Exception catch (e) {
  emit(GetDateAndTimeFaluire(errorMassage: e.toString()));
    }
    }
    
}

