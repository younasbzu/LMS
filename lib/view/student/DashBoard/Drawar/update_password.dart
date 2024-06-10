import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/usermodel.dart';
import 'package:mybzu/uttils/custom_btn.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';
import 'package:mybzu/view/student/login_screen.dart';

class Update_Password extends StatefulWidget {
  const Update_Password({super.key});

  @override
  State<Update_Password> createState() => _Update_PasswordState();
}

class _Update_PasswordState extends State<Update_Password> {
  final TextEditingController oldcontroller = TextEditingController();
  final TextEditingController newcontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();

  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 48, 96),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.off((const Dashboard()));
          },
        ),
      ),
      body: Container(
          height: height,
          width: width,
          decoration: const BoxDecoration(
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Center(
                  child: SizedBox(
                    height: height * 0.2,
                    child: const Image(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomTxtfield(
                    hintText: "Old Password",
                    inputType: TextInputType.visiblePassword,
                    controller: oldcontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                CustomTxtfield(
                    hintText: "New Password",
                    inputType: TextInputType.visiblePassword,
                    controller: newcontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                CustomTxtfield(
                    hintText: "Confirm Password",
                    inputType: TextInputType.emailAddress,
                    controller: confirmcontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.08,
                    ),
                    const Text(
                      "Important Note :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.12,
                  width: width * 0.80,
                  child: const Text(
                    "Your password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                CustomButton(
                  text: "Submit",
                  onPressed: () async {
                    if (newcontroller.text == confirmcontroller.text) {
                      QuerySnapshot snapshot = await FirebaseFirestore.instance
                          .collection("Users")
                          .where("userId",
                              isEqualTo: StaticData.userModel!.userId)
                          .get();
                      UserModel model = UserModel.fromMap(
                          snapshot.docs[0].data() as Map<String, dynamic>);
                      if (model.password == oldcontroller.text) {
                        FirebaseFirestore.instance
                            .collection("Users")
                            .doc(model.userId)
                            .update({"password": confirmcontroller.text});
                        // ignore: use_build_context_synchronously
                        MyFlushBar.showSimpleFlushBar(
                            "password change Successfully",
                            context,
                            Colors.green,
                            Colors.white);
                        Future.delayed(const Duration(seconds: 2), () {
                          Get.off((Login_Screen()));
                        });
                      } else {
                        // ignore: use_build_context_synchronously
                        MyFlushBar.showSimpleFlushBar(
                            "Old Password Is Incorrect",
                            context,
                            Colors.red,
                            Colors.white);
                      }
                    } else {
                      MyFlushBar.showSimpleFlushBar("Fill Same Password",
                          context, Colors.red, Colors.white);
                    }
                  },
                ),
              ],
            ),
          )),
    );
  }
}
