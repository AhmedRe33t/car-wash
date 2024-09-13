import 'package:carwashing/app/car_wash_app.dart';
import 'package:carwashing/core/functions/check_state_changes.dart';
import 'package:carwashing/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 // await getIt<CacheHelper>().init();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

 checkStateChanges();
  runApp(const CarWash());
}

