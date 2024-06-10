import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mybzu/model/campus_model.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/uttils/static_data.dart';
import 'package:uuid/uuid.dart';

class CampusPage extends StatefulWidget {
  const CampusPage({super.key});

  @override
  State<CampusPage> createState() => _CampusPageState();
}

class _CampusPageState extends State<CampusPage> {
  var height, width;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();

  TextEditingController updatenamecontroller = TextEditingController();
  TextEditingController updatecitycontroller = TextEditingController();
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
                        "All Campuses",
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
                                  width: width * 0.3,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: width,
                                        height: height * 0.06,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Create New Campuses",
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
                                          hintText: "Campus Name",
                                          inputType: TextInputType.text,
                                          controller: namecontroller),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      CustomTxtfield(
                                          height: height * 0.07,
                                          width: width * 0.26,
                                          hintText: "City Name",
                                          inputType: TextInputType.text,
                                          controller: citycontroller),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          var uid = Uuid();
                                          String campusId = uid.v4();
                                          CampusModel model = CampusModel(
                                              adminId: StaticData
                                                  .adminModel!.adminId,
                                              adminName: StaticData
                                                  .adminModel!.adminName,
                                              campusId: campusId,
                                              campusCity: citycontroller.text,
                                              campusname: namecontroller.text);
                                          FirebaseFirestore.instance
                                              .collection("campus")
                                              .doc(campusId)
                                              .set(model.toMap());
                                          MyFlushBar.showSimpleFlushBar(
                                              "Campus Added Successfully",
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
                                            "Add Campus",
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
                            "Create New Campus",
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
                        .collection('campus')
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
                                  CampusModel model = CampusModel.fromMap(
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
                                            "${model.campusname}",
                                            style: const TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            "${model.campusCity}",
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
                                                      .collection("campus")
                                                      .doc(model.campusId)
                                                      .delete();
                                                  MyFlushBar.showSimpleFlushBar(
                                                      "campus Delete Successfully",
                                                      context,
                                                      Colors.green,
                                                      Colors.white);
                                                },
                                                child: Icon(Icons
                                                    .delete_forever_outlined)),
                                            InkWell(
                                                onTap: () {
                                                  updatenamecontroller.text =
                                                      model.campusname!;
                                                  updatecitycontroller.text =
                                                      model.campusCity!;

                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height: height * 0.4,
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
                                                                  "Update Campus",
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
                                                                      "Campus Name",
                                                                  inputType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      updatenamecontroller),
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
                                                                      "City Name",
                                                                  inputType:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      updatecitycontroller),
                                                              SizedBox(
                                                                height: height *
                                                                    0.02,
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "campus")
                                                                      .doc(model
                                                                          .campusId)
                                                                      .update({
                                                                    "campusname":
                                                                        updatenamecontroller
                                                                            .text,
                                                                    "campusCity":
                                                                        updatecitycontroller
                                                                            .text
                                                                  });

                                                                  MyFlushBar.showSimpleFlushBar(
                                                                      "Campus Update Successfully",
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
                                                                    "Update Campus",
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
