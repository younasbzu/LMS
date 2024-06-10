import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybzu/model/usermodel.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:uuid/uuid.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  var height, width;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController fathercontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController cniccontroller = TextEditingController();
  TextEditingController placecontroller = TextEditingController();
  TextEditingController bloodcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController campuscontroller = TextEditingController();
  TextEditingController departcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController datetimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    List<String> names = [
      "Asim Ali",
      "John Doe",
      "Jane Doe",
      "Alice Brown",
      "Bob Smith",
      "Charlie Davis",
      "David Lee",
      "Eva Martin",
      "Frank Wilson",
      "George Taylor",
    ];

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.07,
                width: width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "All Users",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 1, 35, 70),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Center(
                                  child: Container(
                                    height: height * 0.8,
                                    width: width * 0.8,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: width,
                                          height: height * 0.06,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "Create New User",
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500,
                                              color: Color.fromARGB(
                                                  255, 1, 35, 70),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * 0.6,
                                          child: const Divider(
                                            color:
                                                Color.fromARGB(255, 1, 35, 70),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.20,
                                          width: width,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              SizedBox(
                                                height: height * 0.18,
                                                width: width * 0.12,
                                                child: const CircleAvatar(
                                                  radius: 35,
                                                  child: Icon(Icons.camera_alt),
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomTxtfield(
                                                        height: height * 0.06,
                                                        width: width * 0.26,
                                                        hintText: "Full Name",
                                                        inputType:
                                                            TextInputType.text,
                                                        controller:
                                                            namecontroller),
                                                    SizedBox(
                                                      height: height * 0.02,
                                                    ),
                                                    CustomTxtfield(
                                                        height: height * 0.06,
                                                        width: width * 0.26,
                                                        hintText: "Father Name",
                                                        inputType:
                                                            TextInputType.text,
                                                        controller:
                                                            fathercontroller),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CustomTxtfield(
                                                        height: height * 0.06,
                                                        width: width * 0.26,
                                                        hintText:
                                                            "Phone Number",
                                                        inputType:
                                                            TextInputType.text,
                                                        controller:
                                                            numbercontroller),
                                                    SizedBox(
                                                      height: height * 0.02,
                                                    ),
                                                    CustomTxtfield(
                                                        height: height * 0.06,
                                                        width: width * 0.26,
                                                        hintText: "CNIC",
                                                        inputType:
                                                            TextInputType.text,
                                                        controller:
                                                            cniccontroller),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        SizedBox(
                                          height: height * 0.07,
                                          width: width * 0.75,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CustomTxtfield(
                                                    height: height * 0.06,
                                                    width: width * 0.26,
                                                    hintText: "Place of Birth",
                                                    inputType:
                                                        TextInputType.text,
                                                    controller:
                                                        placecontroller),
                                              ),
                                              Expanded(
                                                child: CustomTxtfield(
                                                    height: height * 0.06,
                                                    width: width * 0.26,
                                                    hintText: "Personal Email",
                                                    inputType:
                                                        TextInputType.text,
                                                    controller:
                                                        emailcontroller),
                                              ),
                                              Expanded(
                                                child: CustomTxtfield(
                                                    height: height * 0.06,
                                                    width: width * 0.26,
                                                    hintText: "Blood Group",
                                                    inputType:
                                                        TextInputType.text,
                                                    controller:
                                                        bloodcontroller),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.07,
                                          width: width * 0.75,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CustomTxtfield(
                                                    height: height * 0.06,
                                                    width: width * 0.26,
                                                    hintText: "Campus",
                                                    inputType:
                                                        TextInputType.text,
                                                    controller:
                                                        campuscontroller),
                                              ),
                                              Expanded(
                                                child: CustomTxtfield(
                                                    height: height * 0.06,
                                                    width: width * 0.26,
                                                    hintText: "Department",
                                                    inputType:
                                                        TextInputType.text,
                                                    controller:
                                                        departcontroller),
                                              ),
                                              Expanded(
                                                child: CustomTxtfield(
                                                    height: height * 0.06,
                                                    width: width * 0.26,
                                                    hintText: "password",
                                                    inputType:
                                                        TextInputType.text,
                                                    controller: passcontroller),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        Expanded(
                                          child: SizedBox(
                                            height: height * 0.2,
                                            width: width,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  width: width * 0.04,
                                                ),
                                                SizedBox(
                                                  height: height,
                                                  width: width * 0.22,
                                                  child: Column(
                                                    children: [
                                                      Card(
                                                        color: Colors.white,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: SizedBox(
                                                          height: height * 0.05,
                                                          width: width,
                                                          child: TextFormField(
                                                            controller:
                                                                datetimeController,
                                                            cursorColor:
                                                                const Color
                                                                        .fromARGB(
                                                                    255,
                                                                    1,
                                                                    35,
                                                                    70),
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      1,
                                                                      35,
                                                                      70),
                                                            ),
                                                            textInputAction:
                                                                TextInputAction
                                                                    .next,
                                                            onTap: () async {
                                                              final DateTime?
                                                                  pickedDate =
                                                                  await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate:
                                                                    DateTime(
                                                                        2022),
                                                                lastDate:
                                                                    DateTime(
                                                                        2030),
                                                              );
                                                              if (pickedDate !=
                                                                  null) {
                                                                datetimeController
                                                                    .text = DateFormat(
                                                                        'yyyy-MM-dd')
                                                                    .format(
                                                                        pickedDate);
                                                              }
                                                            },
                                                            validator: (value) {
                                                              if (value ==
                                                                      null ||
                                                                  value
                                                                      .isEmpty) {
                                                                return 'This field is required';
                                                              }
                                                              return null;
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          05.0,
                                                                      horizontal:
                                                                          15.0),
                                                              hintText: "Date",
                                                              hintStyle: const TextStyle(
                                                                  color: Colors
                                                                      .black), // Adjust hint text color here

                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Colors
                                                                      .grey,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    const BorderSide(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          50,
                                                                          49,
                                                                          49),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.05,
                                                        child: TextFormField(
                                                          controller: gender,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          decoration:
                                                              const InputDecoration(
                                                            prefixIcon:
                                                                Icon(Icons.wc),
                                                            hintText: "Gender",
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.05,
                                                        width: width * 0.22,
                                                        child: ToggleButtons(
                                                          borderWidth: 0.5,
                                                          borderColor:
                                                              const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  50,
                                                                  49,
                                                                  49),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10)),
                                                          isSelected: [
                                                            gender.text ==
                                                                "Male",
                                                            gender.text ==
                                                                "Female"
                                                          ],
                                                          children: [
                                                            SizedBox(
                                                              height: height,
                                                              width:
                                                                  width * 0.1,
                                                              child: Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.male,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            35,
                                                                            70),
                                                                    size: 30,
                                                                  ),
                                                                  Text(
                                                                    "Male",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: height,
                                                              width:
                                                                  width * 0.1,
                                                              child: Row(
                                                                children: [
                                                                  Icon(
                                                                      Icons
                                                                          .female,
                                                                      color: Color
                                                                          .fromARGB(
                                                                              255,
                                                                              1,
                                                                              35,
                                                                              70),
                                                                      size: 30),
                                                                  Text(
                                                                    "Female",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                          onPressed:
                                                              (int index) {
                                                            setState(() {
                                                              gender.text =
                                                                  index == 0
                                                                      ? "Male"
                                                                      : "Female";
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.03,
                                                ),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: height,
                                                    width: width,
                                                    child: TextField(
                                                      controller:
                                                          addresscontroller,
                                                      maxLines: 2,
                                                      decoration:
                                                          InputDecoration(
                                                        border: OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        hintText:
                                                            'Permanent Address (maximum 100 words)',
                                                        counterText:
                                                            '${addresscontroller.text.length}/100',
                                                      ),
                                                      keyboardType:
                                                          TextInputType
                                                              .multiline,
                                                      onChanged: (value) {
                                                        if (value.length >
                                                            100) {
                                                          addresscontroller
                                                                  .text =
                                                              value.substring(
                                                                  0, 100);
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: width * 0.04,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            var uid = Uuid();
                                            String userId = uid.v4();
                                            UserModel model = UserModel(
                                                password: passcontroller.text,
                                                adminId: StaticData
                                                    .adminModel!.adminId,
                                                adminName: StaticData
                                                    .adminModel!.adminName,
                                                userId: userId,
                                                name: namecontroller.text,
                                                address: addresscontroller.text,
                                                birthPlace:
                                                    placecontroller.text,
                                                bloodgroup:
                                                    bloodcontroller.text,
                                                campus: campuscontroller.text,
                                                cnic: cniccontroller.text,
                                                department:
                                                    departcontroller.text,
                                                dob: datetimeController.text,
                                                email: emailcontroller.text,
                                                fname: fathercontroller.text,
                                                gender: gender.text,
                                                number: numbercontroller.text,
                                                pic:
                                                    "https://images.pond5.com/supervisor-icon-vector-female-user-illustration-171801894_iconl_nowm.jpeg",
                                                status: 0);
                                            FirebaseFirestore.instance
                                                .collection("Users")
                                                .doc(userId)
                                                .set(model.toMap());
                                            MyFlushBar.showSimpleFlushBar(
                                                "User Added Successfully",
                                                context,
                                                Colors.green,
                                                Colors.white);
                                            Future.delayed(Duration(seconds: 2),
                                                () {
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Container(
                                            height: height * 0.07,
                                            width: width * 0.25,
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 1, 35, 70),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Add User",
                                              style: TextStyle(
                                                  fontSize: width * 0.015,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: height * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: height,
                          width: width * 0.15,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 1, 35, 70),
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Text(
                            "Create New User",
                            style: TextStyle(
                                fontSize: width * 0.015,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Users')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return SizedBox(
                        height: height,
                        width: width,
                        child: snapshot.data == null
                            ? Center(child: Text("No Data Found"))
                            : ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  UserModel model = UserModel.fromMap(
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>);
                                  return Card(
                                    elevation: 2,
                                    color: Colors.white,
                                    child: ListTile(
                                      leading: const CircleAvatar(
                                        radius: 30,
                                        backgroundColor:
                                            Color.fromARGB(255, 1, 35, 70),
                                        child: CircleAvatar(
                                          radius: 27,
                                          child: Icon(
                                            Icons.school,
                                            color:
                                                Color.fromARGB(255, 1, 35, 70),
                                          ),
                                        ),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "${model.name}",
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "${model.cnic}",
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "${model.number}",
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      trailing: Container(
                                        width: width * 0.2,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            InkWell(
                                                onTap: () {
                                                  FirebaseFirestore.instance
                                                      .collection("Users")
                                                      .doc(model.userId)
                                                      .delete();
                                                  MyFlushBar.showSimpleFlushBar(
                                                      "User Delete Successfully",
                                                      context,
                                                      Colors.green,
                                                      Colors.white);
                                                },
                                                child: Icon(Icons
                                                    .delete_forever_outlined)),
                                            InkWell(
                                                onTap: () {
                                                  // updatenamecontroller.text =
                                                  //     model.campusname!;
                                                  // updatecitycontroller.text =
                                                  //     model.campusCity!;

                                                  // showDialog(
                                                  //   context: context,
                                                  //   builder: (context) {
                                                  //     return AlertDialog(
                                                  //       content: Container(
                                                  //         height: height * 0.4,
                                                  //         width: width * 0.3,
                                                  //         color: Colors.white,
                                                  //         child: Column(
                                                  //           children: [
                                                  //             Container(
                                                  //               width: width,
                                                  //               height: height *
                                                  //                   0.06,
                                                  //               alignment:
                                                  //                   Alignment
                                                  //                       .center,
                                                  //               child:
                                                  //                   const Text(
                                                  //                 "Update Campus",
                                                  //                 style:
                                                  //                     TextStyle(
                                                  //                   fontSize:
                                                  //                       19,
                                                  //                   fontWeight:
                                                  //                       FontWeight
                                                  //                           .w500,
                                                  //                   color: Color
                                                  //                       .fromARGB(
                                                  //                           255,
                                                  //                           1,
                                                  //                           35,
                                                  //                           70),
                                                  //                 ),
                                                  //               ),
                                                  //             ),
                                                  //             SizedBox(
                                                  //               width:
                                                  //                   width * 0.2,
                                                  //               child:
                                                  //                   const Divider(
                                                  //                 color: Color
                                                  //                     .fromARGB(
                                                  //                         255,
                                                  //                         1,
                                                  //                         35,
                                                  //                         70),
                                                  //               ),
                                                  //             ),
                                                  //             SizedBox(
                                                  //               height: height *
                                                  //                   0.02,
                                                  //             ),
                                                  //             CustomTxtfield(
                                                  //                 height:
                                                  //                     height *
                                                  //                         0.07,
                                                  //                 width: width *
                                                  //                     0.26,
                                                  //                 hintText:
                                                  //                     "Campus Name",
                                                  //                 inputType:
                                                  //                     TextInputType
                                                  //                         .text,
                                                  //                 controller:
                                                  //                     updatenamecontroller),
                                                  //             SizedBox(
                                                  //               height: height *
                                                  //                   0.02,
                                                  //             ),
                                                  //             CustomTxtfield(
                                                  //                 height:
                                                  //                     height *
                                                  //                         0.07,
                                                  //                 width: width *
                                                  //                     0.26,
                                                  //                 hintText:
                                                  //                     "City Name",
                                                  //                 inputType:
                                                  //                     TextInputType
                                                  //                         .text,
                                                  //                 controller:
                                                  //                     updatecitycontroller),
                                                  //             SizedBox(
                                                  //               height: height *
                                                  //                   0.02,
                                                  //             ),
                                                  //             InkWell(
                                                  //               onTap: () {
                                                  //                 FirebaseFirestore
                                                  //                     .instance
                                                  //                     .collection(
                                                  //                         "campus")
                                                  //                     .doc(model
                                                  //                         .campusId)
                                                  //                     .update({
                                                  //                   "campusname":
                                                  //                       updatenamecontroller
                                                  //                           .text,
                                                  //                   "campusCity":
                                                  //                       updatenamecontroller
                                                  //                           .text
                                                  //                 });

                                                  //                 MyFlushBar.showSimpleFlushBar(
                                                  //                     "Campus Update Successfully",
                                                  //                     context,
                                                  //                     Colors
                                                  //                         .green,
                                                  //                     Colors
                                                  //                         .white);
                                                  //                 Future.delayed(
                                                  //                     Duration(
                                                  //                         seconds:
                                                  //                             2),
                                                  //                     () {
                                                  //                   Navigator.pop(
                                                  //                       context);
                                                  //                 });
                                                  //               },
                                                  //               child:
                                                  //                   Container(
                                                  //                 height:
                                                  //                     height *
                                                  //                         0.07,
                                                  //                 width: width *
                                                  //                     0.25,
                                                  //                 decoration: BoxDecoration(
                                                  //                     color: const Color
                                                  //                         .fromARGB(
                                                  //                         255,
                                                  //                         1,
                                                  //                         35,
                                                  //                         70),
                                                  //                     borderRadius:
                                                  //                         BorderRadius.circular(
                                                  //                             10)),
                                                  //                 alignment:
                                                  //                     Alignment
                                                  //                         .center,
                                                  //                 child: Text(
                                                  //                   "Update Campus",
                                                  //                   style: TextStyle(
                                                  //                       fontSize:
                                                  //                           width *
                                                  //                               0.015,
                                                  //                       fontWeight:
                                                  //                           FontWeight
                                                  //                               .w500,
                                                  //                       color: Colors
                                                  //                           .white),
                                                  //                 ),
                                                  //               ),
                                                  //             ),
                                                  //             SizedBox(
                                                  //               height: height *
                                                  //                   0.02,
                                                  //             ),
                                                  //           ],
                                                  //         ),
                                                  //       ),
                                                  //     );
                                                  //   },
                                                  // );
                                                },
                                                child: Icon(Icons.edit)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      );
                    }),
              ),
              // Expanded(
              //   child: SizedBox(
              //     height: height,
              //     width: width,
              //     child: ListView.builder(
              //       itemCount: names.length,
              //       itemBuilder: (context, index) {
              //         return Card(
              //           elevation: 2,
              //           color: Colors.white,
              //           child: ListTile(
              //             iconColor: Colors.blueGrey,
              //             leading: const CircleAvatar(
              //               radius: 30,
              //               backgroundColor: Color.fromARGB(255, 0, 128, 105),
              //               child: CircleAvatar(
              //                 radius: 27,
              //               ),
              //             ),
              //             title: Text(
              //               names[index],
              //               style: const TextStyle(
              //                 overflow: TextOverflow.ellipsis,
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //             trailing: Container(
              //               width: width * 0.20,
              //               child: const Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   Icon(Icons.delete_forever_outlined),
              //                   Icon(Icons.add_outlined),
              //                   Icon(Icons.favorite_border_outlined),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
