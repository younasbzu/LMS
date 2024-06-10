import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mybzu/model/depart_model.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:uuid/uuid.dart';

class Admin_Depart_Page extends StatefulWidget {
  const Admin_Depart_Page({super.key});

  @override
  State<Admin_Depart_Page> createState() => _Admin_Depart_PageState();
}

class _Admin_Depart_PageState extends State<Admin_Depart_Page> {
  var height, width;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController updatenamecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
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
                        "All Departments",
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
                                  height: height * 0.3,
                                  width: width * 0.3,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: width,
                                        height: height * 0.06,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Create New Department",
                                          style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Color.fromARGB(255, 1, 35, 70),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.2,
                                        child: const Divider(
                                          color: Color.fromARGB(255, 1, 35, 70),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      CustomTxtfield(
                                          height: height * 0.07,
                                          width: width * 0.26,
                                          hintText: "Department Name",
                                          inputType: TextInputType.text,
                                          controller: namecontroller),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var uid = Uuid();
                                          String departId = uid.v4();
                                          DepartmentModel model =
                                              DepartmentModel(
                                                  adminId: StaticData
                                                      .adminModel!.adminId,
                                                  adminName: StaticData
                                                      .adminModel!.adminName,
                                                  departId: departId,
                                                  departname:
                                                      namecontroller.text);
                                          FirebaseFirestore.instance
                                              .collection("departs")
                                              .doc(departId)
                                              .set(model.toMap());
                                          MyFlushBar.showSimpleFlushBar(
                                              "Depart Added Successfully",
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
                                            "Add Department",
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
                          width: width * 0.2,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 1, 35, 70),
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Text(
                            "Create New Department",
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
                        .collection('departs')
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
                                  DepartmentModel model =
                                      DepartmentModel.fromMap(
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
                                      title: Text(
                                        "${model.departname}",
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500,
                                        ),
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
                                                      .collection("departs")
                                                      .doc(model.departId)
                                                      .delete();
                                                  MyFlushBar.showSimpleFlushBar(
                                                      "Depart Delete Successfully",
                                                      context,
                                                      Colors.green,
                                                      Colors.white);
                                                },
                                                child: Icon(Icons
                                                    .delete_forever_outlined)),
                                            InkWell(
                                                onTap: () {
                                                  updatenamecontroller.text =
                                                      model.departname!;
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height: height * 0.3,
                                                          width: width * 0.3,
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
                                                                  "Update Department",
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
                                                                    width * 0.2,
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
                                                                    0.02,
                                                              ),
                                                              CustomTxtfield(
                                                                  height:
                                                                      height *
                                                                          0.07,
                                                                  width: width *
                                                                      0.26,
                                                                  hintText:
                                                                      "Department Name",
                                                                  inputType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      updatenamecontroller),
                                                              SizedBox(
                                                                height: height *
                                                                    0.02,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "departs")
                                                                      .doc(model
                                                                          .departId)
                                                                      .update({
                                                                    "departname":
                                                                        updatenamecontroller
                                                                            .text
                                                                  });
                                                                  MyFlushBar.showSimpleFlushBar(
                                                                      "Depart Update Successfully",
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
                                                                    "Update Department",
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
            ],
          ),
        ),
      ),
    );
  }
}
