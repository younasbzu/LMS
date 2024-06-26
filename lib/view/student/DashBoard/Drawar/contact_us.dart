import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/contact_us_model.dart';
import 'package:mybzu/uttils/confirm_dialog.dart';
import 'package:mybzu/uttils/custom_btn.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';
import 'package:uuid/uuid.dart';

class Contact_Us extends StatefulWidget {
  const Contact_Us({super.key});

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController _controller = TextEditingController();

  String? _selectedCourseLabel;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Contect Us",
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
                    height: height * 0.14,
                    child: const Image(
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTxtfield(
                    hintText: "User Name",
                    inputType: TextInputType.name,
                    controller: namecontroller),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomTxtfield(
                    hintText: "Enter Email",
                    inputType: TextInputType.emailAddress,
                    controller: emailcontroller),
                SizedBox(
                  height: height * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    openBottomSheet(context, (label) {
                      setState(() {
                        _selectedCourseLabel = label;
                      });
                    });
                  },
                  child: Container(
                    height: height * 0.065,
                    width: width * 0.88,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.06,
                        ),
                        SizedBox(
                          width: width * 0.66,
                          child: Text(
                            _selectedCourseLabel ?? 'Select Department',
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 15,
                                color: Color.fromARGB(255, 0, 48, 96),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.04,
                        ),
                        const Icon(Icons.arrow_drop_down_outlined)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  width: width * 0.9,
                  child: TextField(
                    controller: _controller,
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18)),
                      hintText: 'Enter Message (maximum 500 words)',
                      counterText: '${_controller.text.length}/500',
                    ),
                    keyboardType: TextInputType.multiline,
                    onChanged: (value) {
                      if (value.length > 300) {
                        _controller.text = value.substring(0, 300);
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                CustomButton(
                  text: "Submit",
                  onPressed: () {
                    var uid = const Uuid();
                    String contactId = uid.v4();
                    ContactModel model = ContactModel(
                        depart: _selectedCourseLabel,
                        email: emailcontroller.text,
                        id: contactId,
                        msg: _controller.text,
                        name: namecontroller.text);
                    FirebaseFirestore.instance
                        .collection("Contacts")
                        .doc(contactId)
                        .set(model.toMap());
                    MyFlushBar.showSimpleFlushBar("User Added Successfully",
                        context, Colors.green, Colors.white);
                  },
                ),
              ],
            ),
          )),
    );
  }

  Future<void> openBottomSheet(
      BuildContext context, Function(String) onSelected) async {
    var courses = [
      ListItem(value: '2', label: 'IT Department'),
      ListItem(value: '3', label: 'Finanical Assistance Department'),
      ListItem(value: '4', label: 'Academics Department'),
      ListItem(value: '5', label: 'Hostel Department'),
      ListItem(value: '6', label: 'Sports Department'),
      ListItem(value: '7', label: 'Software Engineering'),
      ListItem(value: '8', label: 'BSCS'),
      ListItem(value: '9', label: 'Stident Affairs'),
    ];

    double screenHeight = MediaQuery.of(context).size.height;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: screenHeight * 0.4,
          child: ListView.builder(
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(courses[index].label),
                onTap: () {
                  onSelected(courses[index].label);
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}

class ListItem {
  final String value;
  final String label;

  ListItem({required this.value, required this.label});
}
