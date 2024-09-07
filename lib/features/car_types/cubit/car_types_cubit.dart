
import 'package:carwashing/features/car_types/cubit/car_types_state.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarTypesCubit extends Cubit<CarTypesState> {
  CarTypesCubit() : super(CarTypesInitial());

 List<CartypeModel>carTypes=[];
  
 
   


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

}

