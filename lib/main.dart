import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main_Screen.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async{
   WidgetsFlutterBinding.ensureInitialized();
    
    await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: mainScreen(),
    );
  }
}
