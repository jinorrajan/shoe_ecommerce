import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../../utlis/colors.dart';
import 'widgets/account_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contrl = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_rounded,
                      size: 30,
                    ))
              ],
            ),
          ),
          const SizedBox(
            height: 45,
          ),
      
          // Profile image
          const CircleAvatar(
            radius: 60,
            foregroundImage: AssetImage("assets/profile.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Md Abu Ali',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 7,
          ),
          const Text('+91 9487518621'),
          const SizedBox(
            height: 10,
          ),
      
          // Overview Container
          Container(
            height: 447,
            width: double.infinity,
            decoration: BoxDecoration(
              color: CosColors().backgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, left: 25),
                  child: Text(
                    "Account Overview",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                ),
      
                const SizedBox(
                  height: 19,
                ),
      
                // Custom TIle Widget
                AcountOverListTile(
                  iconsOverView: Icons.person_outline,
                  iconOverViewColor: Colors.blue,
                  text: "My Profile",
                ),
                AcountOverListTile(
                  iconsOverView: Icons.shopping_bag_outlined,
                  iconOverViewColor: Colors.red,
                  text: "My Order",
                ),
                AcountOverListTile(
                  iconsOverView: Icons.attach_money_outlined,
                  iconOverViewColor: Colors.purple,
                  text: "Refound",
                ),
                AcountOverListTile(
                  iconsOverView: Icons.lock_open_outlined,
                  iconOverViewColor: Colors.orange,
                  text: "Change Password",
                ),
                AcountOverListTile(
                  iconsOverView: Icons.language_outlined,
                  iconOverViewColor: Colors.green,
                  text: "Change Language",
                ),
                AcountOverListTile(
                  iconsOverView: Icons.logout_outlined,
                  iconOverViewColor: const Color.fromARGB(255, 255, 54, 138),
                  text: "Log Out",
                  onPressed: () => contrl.logout(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
