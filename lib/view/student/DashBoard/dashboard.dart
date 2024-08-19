import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybzu/uttils/confirm_dialog.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/view/student/DashBoard/Drawar/contact_us.dart';
import 'package:mybzu/view/student/DashBoard/Drawar/edit_profile.dart';
import 'package:mybzu/view/student/DashBoard/Drawar/my_profile.dart';
import 'package:mybzu/view/student/DashBoard/Drawar/update_password.dart';
import 'package:mybzu/model/gridview_model.dart';
import 'package:mybzu/view/student/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
  dynamic launchEmail() async {
    try {
      Uri email = Uri(
        scheme: 'mailto',
        path: "muhammadyounisbzu@gmail.com",
        queryParameters: {'subject': "How Can I Help You"},
      );
      await launchUrl(email);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfirmDialogView(
                      description: 'Do You Really Want To Quit?',
                      leftButtonText: 'Cancel',
                      rightButtonText: 'Quit',
                      onAgreeTap: () {
                        SystemNavigator.pop();
                      });
                }) ??
            false;
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'Dashboard',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 8, 49, 101),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 103, 79, 163),
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 0.05,
                    width: 0.05,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Image(
                      image: AssetImage("assets/logo.png"),
                    ),
                  )),
              ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 8, 49, 101),
                ),
                title: const Text(
                  'My Profile',
                  style: TextStyle(color: Color.fromARGB(255, 8, 49, 101)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfile(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.edit,
                  color: Color.fromARGB(255, 8, 49, 101),
                ),
                title: const Text(
                  'Edit Profile',
                  style: TextStyle(color: Color.fromARGB(255, 8, 49, 101)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Edit_Profile(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.lock_clock_sharp,
                  color: Color.fromARGB(255, 8, 49, 101),
                ),
                title: const Text(
                  'Update Password',
                  style: TextStyle(color: Color.fromARGB(255, 8, 49, 101)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Update_Password(),
                      ));
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.contact_page_rounded,
                  color: Color.fromARGB(255, 8, 49, 101),
                ),
                title: const Text(
                  'Contact Us',
                  style: TextStyle(color: Color.fromARGB(255, 8, 49, 101)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Contact_Us(),
                      ));
                },
              ),

              ListTile(
                  leading: const Icon(
                    Icons.logout_sharp,
                    color: Color.fromARGB(255, 8, 49, 101),
                  ),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(color: Color.fromARGB(255, 8, 49, 101)),
                  ),
                  onTap: () async {
                    // Obtain shared preferences.
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.remove('id');
                    await prefs.remove('status');
                    // ignore: use_build_context_synchronously
                    MyFlushBar.showSimpleFlushBar("Logout Successfully",
                        context, Colors.red, Colors.white);
                    Timer(Duration.zero, () {
                      Timer(const Duration(seconds: 2), () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login_Screen()),
                            (route) => false);
                      });
                    });
                  }),
              // Add more items as needed
            ],
          ),
        ),

        //////Dashboard settings///////////////////////////////////
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: GridView.builder(
            itemCount: gridItems.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 1.0,
            ),
            itemBuilder: (context, index) {
              final item = gridItems[index];
              return InkWell(
                onTap: () async {
                  if (item.title == "Transport") {
                    Uri url = Uri.parse('');
                    await launch(
                        "https://play.google.com/store/apps/details?id=com.bzutracking.flutter_application");
                  } else {
                    if (item.destination != null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => item.destination!,
                          ));
                    }
                  }
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 8, 49, 101), width: 1.5),
                  ),
                  color: const Color.fromARGB(255, 224, 224, 224),
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: height * 0.048,
                        color: const Color.fromARGB(255, 8, 49, 101),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: height * 0.025,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
