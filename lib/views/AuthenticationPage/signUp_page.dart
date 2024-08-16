// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_application_2/controller/auth_controller.dart';
import 'package:flutter_application_2/utlis/colors.dart';
import 'package:flutter_application_2/views/AuthenticationPage/login_page.dart';
import 'package:flutter_application_2/views/AuthenticationPage/widget/input_field.dart';
import 'package:get/get.dart';
import '../../utlis/constants/widgets/button_widget.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
   final contrl = Get.put(AuthController());
   

    return SafeArea(
      child: Scaffold(
        backgroundColor: CosColors().backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'assets/signUp.png',
                height: 350,
                width: 350,
              )),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: CosColors().mainTextColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Please Create a account for you",
                  style: TextStyle(
                      color: CosColors().SeccondaryMainTextColor, fontSize: 16),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: InputFieldWidget(
                    controller: contrl.username,
                hintText: "Your Name",
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: InputFieldWidget(
                    controller: contrl.email,
                hintText: "Your Email",
              )),
              const SizedBox(
                height: 20,
              ),
              Center(
                  child: InputFieldWidget(
                    controller: contrl.password,
                hintText: "Your Password",
              )),
              const SizedBox(
                height: 20,
              ),

              // SingUp Botton and Function
              Obx(
                ()=> Center(
                    child: contrl.loading.value?const CircularProgressIndicator():ButtonWidget(
                  Btext: "Sign Up",
                  Bheight: 50,
                  bWidth: 330,
                  bRadious: 15,
                  btextFontSize: 20,
                  onPressed: ()=> contrl.signUp(),
                )),
              ),


               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I  have an account?",style:TextStyle(fontSize: 15)),
                  TextButton(onPressed: (){
                    Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>  const LoginScreen()));
                  }, child: const Text("Sign In",style:TextStyle(fontSize: 18) ,))

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
