

import 'package:carwashing/features/standered_wash/presentation/cubit/date_time_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DateTimeCubit extends Cubit<DateTimeState> {
  DateTimeCubit() : super(DateTimeInitial());
  TextEditingController timePicker=TextEditingController();

     TextEditingController datePicker=TextEditingController();

}
