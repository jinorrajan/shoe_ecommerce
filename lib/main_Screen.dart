// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

import 'utlis/colors.dart';
import 'views/LikedScreen/like_screen.dart';
import 'views/ProfieScreen/profile_screen.dart';
import 'views/cartScreen/cart_screen.dart';
import 'views/homeScreen/home_screen.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => __MainScreenStateState();
}

class __MainScreenStateState extends State<mainScreen> {
  int pageIndex = 0;

  final pages = [
    HomeScreen(),
    const LikeScreen(),
    const cartScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(222, 243, 249, 1),
        body: pages[pageIndex],

        // bottom Navigation 
        bottomNavigationBar: Container(
          height: 70,
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
              color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 0;
                    });
                  },
                  icon: pageIndex == 0
                      ?  Icon(Icons.home_outlined,
                          color: CosColors().ButtonColor,size: 32)
                      : const Icon(Icons.home_outlined, color: Colors.black38,size: 32,)),
             
              IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 1;
                    });
                  },
                  icon: pageIndex == 1
                      ?  Icon(Icons.favorite_border,
                          color: CosColors().ButtonColor,size: 30)
                      : const Icon(Icons.favorite_border,
                          color: Colors.black38,size: 30)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 2;
                    });
                  },
                  icon: pageIndex == 2
                      ?  Icon(Icons.local_grocery_store_outlined,
                          color: CosColors().ButtonColor,size: 30)
                      : const Icon(Icons.local_grocery_store_outlined,
                          color: Colors.black38,size: 30)),
              IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = 3;
                    });
                  },
                  icon: pageIndex == 3
                      ?  Icon(Icons.person_3_outlined,
                          color: CosColors().ButtonColor,size: 30)
                      : const Icon(
                          Icons.person_3_outlined,
                          color: Colors.black38,size: 30
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
