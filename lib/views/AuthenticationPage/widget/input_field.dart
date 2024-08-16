// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  var hintText;
  
  var controller;

  InputFieldWidget({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
        height: 70,
        width: 365,
        decoration: const BoxDecoration(
             boxShadow:  [
           BoxShadow(
            color: Color.fromARGB(157, 227, 227, 227),
            spreadRadius: 1,
            blurRadius: 7,
          )
        ],
        ),
        child: TextFormField(
          controller: controller,
           style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20),),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(20)),
            filled: true,
            hintStyle: const TextStyle(color: Colors.black26),
            hintText: hintText,
            
          ),
        ));
  }
}
