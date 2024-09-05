import 'package:carwashing/core/utils/app_string.dart';
import 'package:carwashing/features/car_types/data/carType_model.dart';

class ProfileDataMode{
  final String email;
  final String image;
  final String name;
  final String phone;
  final List<CartypeModel> carTypes;
  

  ProfileDataMode({required this.carTypes,required this.email, required this.image, required this.name, required this.phone,});
  factory ProfileDataMode.fromJson(jsonDta,listCarTypes){
     return ProfileDataMode(
      email:jsonDta[DataString.email] ,
      image: jsonDta[DataString.image],
      name:jsonDta[DataString.name] , 
      phone:jsonDta[DataString.phone] ,
      carTypes: listCarTypes
      
      );
      
  }
}