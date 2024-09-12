// before_start_page_cubit.dart

import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'before_start_page_state.dart';







class CarTypesCubit extends Cubit<CarTypesState> {
  CarTypesCubit() : super(CarTypesInitial());

 List<CartypeModel>carTypes=[];
  
   addCarTypes({required String carType,required String carImage})async{
    emit(AddCarTypesLoading());
   try {
  await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).collection('carTypes').add({
   'name':carType,
   'image':carImage
  });
  emit(AddCarTypesSuccess());
} on Exception catch (e) {
   emit(AddCarTypesFaluire(errorMassege: e.toString()));
}
   }

   getCarTypes()async{
    emit(GetCarTypesLoading());
   try {
  await FirebaseFirestore.instance.collection('carTypes').get().then((value){
     value.docs.forEach((elemnt){
      carTypes.add(CartypeModel.fromJson(elemnt.data()));
     });
     emit(GetCarTypesSuccess());
   });
} on Exception catch (e) {
   emit(GetCarTypesFaluire(errorMassege: e.toString()));
}
   }


 void selectCar(String carType) {
    emit(BeforeStartPageLoading());
    try {
      
        emit(BeforeStartPageSuccess(carType));
     
    } catch (e) {
      emit(BeforeStartPageFailure('Failed to select car'));
    }
  }


}


