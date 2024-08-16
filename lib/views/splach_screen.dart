// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/AuthenticationPage/login_page.dart';

import '../utlis/colors.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  @override
  void initState() {
    super.initState();
   SplachFunc();
    
  }

  // ignore: non_constant_identifier_names
  SplachFunc()async{
   await Future.delayed(const Duration(milliseconds: 2000),(){});
   Navigator.pop(context);
     Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  const LoginScreen()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CosColors().backgroundColor,
      body: Center(
        child: Image.asset("assets/splac.png"),
      ),
    );
  }
}