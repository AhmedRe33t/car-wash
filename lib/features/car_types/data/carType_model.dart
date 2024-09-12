
import 'package:carwashing/core/utils/app_string.dart';

class CartypeModel{
  final String name;
  final String image;
  

  CartypeModel({required this.name, required this.image, });
  factory CartypeModel.fromJson(jsonData){
    return CartypeModel(
      name:jsonData['name'] , 
      image:jsonData['image'],
       );
  }
}