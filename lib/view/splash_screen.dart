import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/admin_model.dart';
import 'package:mybzu/model/usermodel.dart';
import 'package:mybzu/uttils/responsive.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:mybzu/view/admin_pannel/dashboard.dart';
import 'package:mybzu/view/admin_pannel/login_screen.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';
import 'package:mybzu/view/student/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_Screen extends StatefulWidget {
  const splash_Screen({super.key});

  @override
  State<splash_Screen> createState() => _splash_ScreenState();
}

class _splash_ScreenState extends State<splash_Screen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);
    _scaleAnimation.addListener(() {
      setState(() {});
    });
    getDataFromSf();
    // Future.delayed(const Duration(seconds: 4), () {

    //   Responsive.isMobile(context)
    //       ? Get.off((Login_Screen()))
    //       : Get.off((Admin_Login_screen()));
    // });
  }

  getDataFromSf() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userid = prefs.getString('id');
    final bool? status = prefs.getBool('status');
    if (userid != null) {
      if (status == true) {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("admins")
            .where("adminId", isEqualTo: userid)
            .get();
        AdminModel model = AdminModel.fromMap(
            querySnapshot.docs[0].data() as Map<String, dynamic>);
        StaticData.adminModel = model;
        Timer(Duration.zero, () {
          Timer(const Duration(seconds: 4), () {
            Get.off((AdminPanel()));
          });
        });
      } else {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection("Users")
            .where("userId", isEqualTo: userid)
            .get();
        UserModel model = UserModel.fromMap(
            querySnapshot.docs[0].data() as Map<String, dynamic>);
        StaticData.userModel = model;
        Timer(Duration.zero, () {
          Timer(const Duration(seconds: 4), () {
            Get.off((const Dashboard()));
          });
        });
      }
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        Responsive.isMobile(context)
            ? Get.off((Login_Screen()))
            : Get.off((Admin_Login_screen()));
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
        child: Column(
          children: [
            SizedBox(
              height: height * 0.3,
            ),
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 2000),
                height: height * 0.3 * _scaleAnimation.value,
                child: const Image(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
