import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/main_Screen.dart';
import 'package:flutter_application_2/utlis/colors.dart';
import 'package:flutter_application_2/utlis/constants/constantFiles/constsnt.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../views/AuthenticationPage/login_page.dart';

class AuthController extends GetxController {
  // create Instance
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController loginemail = TextEditingController();
  final TextEditingController loginpass = TextEditingController();
  var loading = false.obs;

// save data
  Future adduserData(String userName, String emails) async {
    try {
      await FirebaseFirestore.instance.collection("users").add({
        'userName': userName,
        'email': emails,
      });
      log('User data added successfully: $userName, $emails');
    } catch (e) {
      log('Failed to add user data: $e');
      Get.snackbar("Error", "Failed to add user data: $e");
    }
  }

//SiginUp function
  Future<void> signUp() async {
    final emails = email.text;
    final passwords = password.text;
    // Url for firebase
    const url =
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$API_KEY";
    try {
      loading.value = true;
      final res = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'email': emails,
            'password': passwords,
            'returnSecureToken': true,
          },
        ),
      );

      final response = json.decode(res.body);
      // checking  and navigatige screen
      if (res.statusCode == 200) {
        log("helo");
        adduserData(username.text, email.text);
        Get.to(const mainScreen());
      } else {
        log('signUp failed: ${response['error']['message']}');
        Get.snackbar("Error", response['error']['message']);
      }
      log(response['localId']);

    } catch (e) {
      loading.value = false;
      Get.snackbar("Erroe", '$e');
    }
  }

  // Login function
  Future<void> logIn() async {
    final loginEmail = loginemail.text;
    final loginPassword = loginpass.text;
    // Url for firebase
    const loginUrl =
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$API_KEY";
    try {
      loading.value = true;
      final res = await http.post(
        Uri.parse(loginUrl),
        body: json.encode(
          {
            'email': loginEmail,
            'password': loginPassword,
            'returnSecureToken': true,
          },
        ),
      );

      final response = json.decode(res.body);
      // check statuscode and navigateScreen
      if (res.statusCode == 200) {
        log("helo");
        Get.to(const mainScreen());
      } else {
        (f) {
          Get.snackbar(
            "Error",
            '$f',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: CosColors().backgroundColor,
          );
        };
      }

      log(response['localId']);
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", '$e');
    }
  }

// Logout function using sharepreference
  Future<void> logout() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      log("object");
      await prefs.clear(); // Clear all saved user data

      Get.off(() => const LoginScreen());
    } catch (e) {
      Get.snackbar("Error", "Failed to logout: $e");
      log("$e");
    }
  }
}
