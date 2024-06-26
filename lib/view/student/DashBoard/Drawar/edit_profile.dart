import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybzu/uttils/confirm_dialog.dart';
import 'package:mybzu/uttils/custom_btn.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';

class Edit_Profile extends StatefulWidget {
  const Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  final TextEditingController fnamecontroller = TextEditingController();
  final TextEditingController lnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController cinccontroller = TextEditingController();
  bool _rememberMe = false;
  @override
  void initState() {
    fnamecontroller.text = StaticData.userModel!.name!;
    lnamecontroller.text = StaticData.userModel!.fname!;
    emailcontroller.text = StaticData.userModel!.email!;
    numbercontroller.text = StaticData.userModel!.number!;
    cinccontroller.text = StaticData.userModel!.cnic!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 48, 96),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Get.off((Dashboard()));
          },
        ),
      ),
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.04,
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
                  height: height * 0.04,
                ),
                CustomTxtfield(
                    hintText: "Full Name",
                    inputType: TextInputType.name,
                    controller: fnamecontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                CustomTxtfield(
                    hintText: "Father Name",
                    inputType: TextInputType.name,
                    controller: lnamecontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                CustomTxtfield(
                    hintText: "EmailAddress",
                    inputType: TextInputType.emailAddress,
                    controller: emailcontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                CustomTxtfield(
                    hintText: "Ph#Number",
                    inputType: TextInputType.number,
                    controller: numbercontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                CustomTxtfield(
                    hintText: "CNIC",
                    inputType: TextInputType.number,
                    controller: cinccontroller),
                SizedBox(
                  height: height * 0.015,
                ),
                InkWell(
                  onTap: () {
                    FirebaseFirestore.instance
                        .collection("Users")
                        .doc(StaticData.userModel!.userId)
                        .update({
                      "name": fnamecontroller.text,
                      "email": emailcontroller.text,
                      "number": numbercontroller.text,
                      "cnic": cinccontroller.text,
                      "fname": lnamecontroller.text,
                    });
                    MyFlushBar.showSimpleFlushBar("Update Successfully",
                        context, Colors.green, Colors.white);
                    Future.delayed(const Duration(seconds: 2), () {
                      Get.off((Dashboard()));
                    });
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
                            "Update",
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
                SizedBox(
                  height: height * 0.015,
                ),
              ],
            ),
          )),
    );
  }
}
