import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/uttils/custom_btn.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/view/admin_pannel/login_screen.dart';

class Forgot_Screen extends StatefulWidget {
  const Forgot_Screen({super.key});

  @override
  State<Forgot_Screen> createState() => _Forgot_ScreenState();
}

class _Forgot_ScreenState extends State<Forgot_Screen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 35, 70),
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.25, right: width * 0.25),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.15,
                    ),
                    Center(
                      child: Container(
                        height: height * 0.2,
                        child: Image(
                          image: AssetImage('assets/logo.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomTxtfield(
                        hintText: "Enter You E-Mail",
                        inputType: TextInputType.name,
                        controller: namecontroller),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    CustomButton(
                      text: "Submit",
                      buttonWidth: width * 0.18,
                      onPressed: () {
                        Get.off((Admin_Login_screen()));
                      },
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
