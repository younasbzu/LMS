import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/admin_model.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:uuid/uuid.dart';

class AdminInfoPage extends StatefulWidget {
  const AdminInfoPage({super.key});

  @override
  State<AdminInfoPage> createState() => _AdminInfoPageState();
}

class _AdminInfoPageState extends State<AdminInfoPage> {
  var height, width;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController updatednamecontroller = TextEditingController();
  TextEditingController updatednumbercontroller = TextEditingController();
  TextEditingController upatedemailcontroller = TextEditingController();
  TextEditingController upatedpasswordcontroller = TextEditingController();
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
                        "All Admins",
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
                                content: Container(
                                  height: height * 0.4,
                                  width: width * 0.8,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: width,
                                        height: height * 0.06,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Create New Admin",
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 1, 35, 70),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.6,
                                        child: const Divider(
                                          color: Color.fromARGB(255, 1, 35, 70),
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
                                                      hintText: "E-Mail",
                                                      inputType:
                                                          TextInputType.text,
                                                      controller:
                                                          emailcontroller),
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
                                                      hintText: "Phone Number",
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
                                                      hintText: "Password",
                                                      inputType:
                                                          TextInputType.text,
                                                      controller:
                                                          passwordcontroller),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var uid = Uuid();
                                          String adminId = uid.v4();
                                          AdminModel model = AdminModel(
                                              adminId: adminId,
                                              adminName: namecontroller.text,
                                              adminEmail: emailcontroller.text,
                                              adminNumber:
                                                  numbercontroller.text,
                                              adminpass:
                                                  passwordcontroller.text,
                                              addedBy: "admin",
                                              adminImage:
                                                  "https://images.pond5.com/supervisor-icon-vector-female-user-illustration-171801894_iconl_nowm.jpeg",
                                              status: 0);
                                          FirebaseFirestore.instance
                                              .collection("admins")
                                              .doc(adminId)
                                              .set(model.toMap());
                                          MyFlushBar.showSimpleFlushBar(
                                              "Admin Added Successfully",
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
                                            "Add Admin",
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
                            "Create New Admin",
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
                        .collection('admins')
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
                                  AdminModel model = AdminModel.fromMap(
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
                                          Expanded(
                                            child: Text(
                                              "${model.adminName}",
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${model.adminEmail}",
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              "${model.adminNumber}",
                                              style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
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
                                                      .collection("admins")
                                                      .doc(model.adminId)
                                                      .delete();
                                                  MyFlushBar.showSimpleFlushBar(
                                                      "Admin Delete Successfully",
                                                      context,
                                                      Colors.green,
                                                      Colors.white);
                                                },
                                                child: Icon(Icons
                                                    .delete_forever_outlined)),
                                            InkWell(
                                                onTap: () {
                                                  updatednamecontroller.text =
                                                      model.adminName!;
                                                  upatedemailcontroller.text =
                                                      model.adminEmail!;
                                                  upatedpasswordcontroller
                                                      .text = model.adminpass!;
                                                  updatednumbercontroller.text =
                                                      model.adminNumber!;
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height: height * 0.4,
                                                          width: width * 0.8,
                                                          color: Colors.white,
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: width,
                                                                height: height *
                                                                    0.06,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    const Text(
                                                                  "Update Admin",
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        19,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            1,
                                                                            35,
                                                                            70),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                    width * 0.6,
                                                                child:
                                                                    const Divider(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          1,
                                                                          35,
                                                                          70),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.20,
                                                                width: width,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.18,
                                                                      width: width *
                                                                          0.12,
                                                                      child:
                                                                          const CircleAvatar(
                                                                        radius:
                                                                            35,
                                                                        child: Icon(
                                                                            Icons.camera_alt),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          CustomTxtfield(
                                                                              height: height * 0.06,
                                                                              width: width * 0.26,
                                                                              hintText: "Full Name",
                                                                              inputType: TextInputType.text,
                                                                              controller: updatednamecontroller),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.02,
                                                                          ),
                                                                          CustomTxtfield(
                                                                              height: height * 0.06,
                                                                              width: width * 0.26,
                                                                              hintText: "E-Mail",
                                                                              inputType: TextInputType.text,
                                                                              controller: upatedemailcontroller),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          CustomTxtfield(
                                                                              height: height * 0.06,
                                                                              width: width * 0.26,
                                                                              hintText: "Phone Number",
                                                                              inputType: TextInputType.text,
                                                                              controller: updatednumbercontroller),
                                                                          SizedBox(
                                                                            height:
                                                                                height * 0.02,
                                                                          ),
                                                                          CustomTxtfield(
                                                                              height: height * 0.06,
                                                                              width: width * 0.26,
                                                                              hintText: "Password",
                                                                              inputType: TextInputType.text,
                                                                              controller: upatedpasswordcontroller),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.02,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "admins")
                                                                      .doc(model
                                                                          .adminId)
                                                                      .update({
                                                                    "adminName":
                                                                        updatednamecontroller
                                                                            .text,
                                                                    "adminEmail":
                                                                        upatedemailcontroller
                                                                            .text,
                                                                    "adminNumber":
                                                                        updatednumbercontroller
                                                                            .text,
                                                                    "adminpass":
                                                                        upatedpasswordcontroller
                                                                            .text
                                                                  });
                                                                  MyFlushBar.showSimpleFlushBar(
                                                                      "Admin updated Successfully",
                                                                      context,
                                                                      Colors
                                                                          .green,
                                                                      Colors
                                                                          .white);
                                                                  Future.delayed(
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  });
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      height *
                                                                          0.07,
                                                                  width: width *
                                                                      0.25,
                                                                  decoration: BoxDecoration(
                                                                      color: const Color
                                                                              .fromARGB(
                                                                          255,
                                                                          1,
                                                                          35,
                                                                          70),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    "Update Admin",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            width *
                                                                                0.015,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.02,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
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
              //               child: Row(
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
