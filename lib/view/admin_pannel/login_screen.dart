import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/admin_model.dart';
import 'package:mybzu/uttils/custom_btn.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:mybzu/view/admin_pannel/dashboard.dart';
import 'package:mybzu/view/admin_pannel/forgot_password.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Admin_Login_screen extends StatefulWidget {
  const Admin_Login_screen({super.key});

  @override
  State<Admin_Login_screen> createState() => _Admin_Login_screenState();
}

class _Admin_Login_screenState extends State<Admin_Login_screen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _rememberMe = false;
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    namecontroller.text = "nomi@gmail.com";
    passwordcontroller.text = "123123";
    super.initState();
  }

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
            child: Stack(
              children: [
                Container(
                  height: height,
                  width: width,
                  margin:
                      EdgeInsets.only(left: width * 0.35, right: width * 0.35),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.04,
                        ),
                        const Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/logo.png'),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        const Text(
                          "Wellcome To BZU",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        CustomTxtfield(
                            hintText: "E-Mail",
                            inputType: TextInputType.name,
                            controller: namecontroller),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        CustomTxtfield(
                            hintText: "Enter Password",
                            inputType: TextInputType.text,
                            isPassword: true,
                            controller: passwordcontroller),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  activeColor:
                                      Color.fromARGB(255, 229, 173, 50),
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Remember Me",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 229, 173, 50),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.012,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Get.to((Forgot_Screen()));
                              },
                              child: Text(
                                "Forgot Password",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 229, 173, 50),
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.012,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                          width: width * 0.04,
                        ),
                        CustomButton(
                          text: "Login",
                          buttonWidth: width * 0.18,
                          onPressed: () async {
                            if (formkey.currentState!.validate() &&
                                _rememberMe == true) {
                              QuerySnapshot snapshot = await FirebaseFirestore
                                  .instance
                                  .collection("admins")
                                  .where("adminEmail",
                                      isEqualTo: namecontroller.text)
                                  .where("adminpass",
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
                                AdminModel model = AdminModel.fromMap(
                                    snapshot.docs[0].data()
                                        as Map<String, dynamic>);
                                StaticData.adminModel = model;
                                saveDatatoSF(model.adminId!, true);
                                Get.off((AdminPanel()));
                              }
                            } else {
                              MyFlushBar.showSimpleFlushBar(
                                  "Fill All The Fields",
                                  context,
                                  Colors.red,
                                  Colors.white);
                            }
                          },
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
