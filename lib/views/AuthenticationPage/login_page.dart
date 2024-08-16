import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/auth_controller.dart';
import 'package:flutter_application_2/utlis/colors.dart';
import 'package:flutter_application_2/utlis/constants/widgets/button_widget.dart';
import 'package:flutter_application_2/views/AuthenticationPage/signUp_page.dart';
import 'package:flutter_application_2/views/AuthenticationPage/widget/input_field.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contrl = Get.put(AuthController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: CosColors().backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Image.asset(
                    "assets/login.png",
                    height: 270,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Welcome Back!",
                style: TextStyle(
                    color: CosColors().mainTextColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Please Login into your existing account",
                style: TextStyle(
                    color: CosColors().SeccondaryMainTextColor, fontSize: 16),
              ),
              const SizedBox(
                height: 30,
              ),

              //Email and Password InputField Custom Widget
              InputFieldWidget(
                hintText: " Your Email",
                controller: contrl.loginemail,
              ),
              const SizedBox(
                height: 20,
              ),
              InputFieldWidget(
                hintText: " Your Password",
                controller: contrl.loginpass,
              ),
              const SizedBox(
                height: 30,
              ),

              //Login Button
              ButtonWidget(
                Btext: "Log in",
                Bheight: 50,
                bWidth: 330,
                bRadious: 15,
                btextFontSize: 20,
                onPressed: () => contrl.logIn(),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("I don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()));
                      },
                      child: Text("Sign Up"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
