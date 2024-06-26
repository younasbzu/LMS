import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/usermodel.dart';
import 'package:mybzu/uttils/confirm_dialog.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';
import 'package:mybzu/view/student/forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({super.key});

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _rememberMe = false;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
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
                    height: height * 0.1,
                  ),
                  Center(
                    child: SizedBox(
                      height: height * 0.2,
                      child: const Image(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  CustomTxtfield(
                      hintText: "User Name",
                      inputType: TextInputType.name,
                      controller: namecontroller),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTxtfield(
                      hintText: "Enter Password",
                      inputType: TextInputType.text,
                      isPassword: true,
                      controller: passwordcontroller),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Checkbox(
                        activeColor: const Color.fromARGB(255, 229, 173, 50),
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      const Text(
                        "Remember Me",
                        style: TextStyle(
                            color: Color.fromARGB(255, 229, 173, 50),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.15,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Forgot_Screen(),
                                ));
                          },
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Color.fromARGB(255, 229, 173, 50),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    child: InkWell(
                      onTap: () async {
                        if (formkey.currentState!.validate() &&
                            _rememberMe == true) {
                          QuerySnapshot snapshot = await FirebaseFirestore
                              .instance
                              .collection("Users")
                              .where("email", isEqualTo: namecontroller.text)
                              .where("password",
                                  isEqualTo: passwordcontroller.text)
                              .get();
                          if (snapshot.docs.isEmpty) {
                            // ignore: use_build_context_synchronously
                            MyFlushBar.showSimpleFlushBar(
                                "email or password is incorrect",
                                context,
                                Colors.red,
                                Colors.white);
                          } else {
                            UserModel model = UserModel.fromMap(snapshot.docs[0]
                                .data() as Map<String, dynamic>);
                            StaticData.userModel = model;
                            saveDatatoSF(model.userId!, false);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Dashboard(),
                                ));
                          }
                        } else {
                          MyFlushBar.showSimpleFlushBar("Fill All The Fields",
                              context, Colors.red, Colors.white);
                        }
                      },
                      child: Container(
                        height: height * 0.07,
                        width: width * 0.8, // Use buttonWidth here
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 48, 96),
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.028,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // CustomButton(
                  //   text: "Login",
                  //   onPressed: () {
                  //     Get.off((Dashboard()));
                  //   },
                  // ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                ],
              ),
            )),
      ),
    );
  }

  saveDatatoSF(String userid, bool isadmin) async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('id', userid);
    await prefs.setBool('status', isadmin);
  }
}
