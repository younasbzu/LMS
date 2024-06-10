import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mybzu/model/cource_model.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:uuid/uuid.dart';

class Plan_of_Study extends StatefulWidget {
  @override
  _Plan_of_StudyState createState() => _Plan_of_StudyState();
}

class _Plan_of_StudyState extends State<Plan_of_Study> {
  final List<Map<String, dynamic>> _semesters = List.generate(8, (index) {
    return {
      'semester': index + 1,
      'courses': List.generate(4, (index) {
        return {
          'courseCode': 'Code $index',
          'courseTitle': 'Title $index',
          'creditHours': '3'
        };
      }),
    };
  });

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController creditcontroller = TextEditingController();
  TextEditingController updatetitlecontroller = TextEditingController();
  TextEditingController updatecreditcontroller = TextEditingController();
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Plan Of Study'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.8,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: _semesters.length,
        itemBuilder: (context, index) {
          return SemesterCard(
            semesterData: index + 1,
            onEdit: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Container(
                      height: height * 0.7,
                      width: width * 0.4,
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            width: width,
                            height: height * 0.06,
                            alignment: Alignment.center,
                            child: const Text(
                              "Create New Course",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 1, 35, 70),
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
                            height: height * 0.1,
                            width: width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: CustomTxtfield(
                                      height: height * 0.06,
                                      width: width * 0.26,
                                      hintText: "C_Title",
                                      inputType: TextInputType.text,
                                      controller: titlecontroller),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Expanded(
                                  child: CustomTxtfield(
                                      height: height * 0.06,
                                      width: width * 0.26,
                                      hintText: "Cr_Hours",
                                      inputType: TextInputType.text,
                                      controller: creditcontroller),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      print("Button press");
                                      var uid = Uuid();
                                      String courceId = uid.v4();
                                      CourceModel model = CourceModel(
                                          cHourse: creditcontroller.text,
                                          courceId: courceId,
                                          smester: index + 1,
                                          title: titlecontroller.text);
                                      FirebaseFirestore.instance
                                          .collection("Cources")
                                          .doc(courceId)
                                          .set(model.toMap());
                                      MyFlushBar.showSimpleFlushBar(
                                          "Course Added Successfully",
                                          context,
                                          Colors.green,
                                          Colors.white);
                                    },
                                    child: Container(
                                      height: height * 0.06,
                                      width: width * 0.25,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 1, 35, 70),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Add Cource",
                                        style: TextStyle(
                                            fontSize: width * 0.015,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width,
                            height: height * 0.06,
                            alignment: Alignment.center,
                            child: const Text(
                              "All Courses",
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 1, 35, 70),
                              ),
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Cources')
                                    .where("smester", isEqualTo: index + 1)
                                    .snapshots(),
                                builder: (context,
                                    AsyncSnapshot<QuerySnapshot> snapshot) {
                                  return SizedBox(
                                    height: height,
                                    width: width,
                                    child: snapshot.data == null
                                        ? Center(child: Text("No Data Found"))
                                        : ListView.builder(
                                            itemCount:
                                                snapshot.data!.docs.length,
                                            itemBuilder: (context, index) {
                                              CourceModel model =
                                                  CourceModel.fromMap(snapshot
                                                          .data!.docs[index]
                                                          .data()
                                                      as Map<String, dynamic>);
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height: height * 0.07,
                                                  width: width,
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromARGB(
                                                                  255,
                                                                  0,
                                                                  48,
                                                                  96)
                                                              .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        height: height,
                                                        width: width * 0.05,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                            "${index + 1}"),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: height,
                                                          width: width,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              "${model.title}"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Expanded(
                                                        child: Container(
                                                          height: height,
                                                          width: width,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                              "${model.cHourse} Credit Hours"),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      SizedBox(
                                                        height: height,
                                                        width: width * 0.1,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "Cources")
                                                                      .doc(model
                                                                          .courceId)
                                                                      .delete();
                                                                  MyFlushBar.showSimpleFlushBar(
                                                                      "Delete Successfully",
                                                                      context,
                                                                      Colors
                                                                          .green,
                                                                      Colors
                                                                          .white);
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .delete)),
                                                            InkWell(
                                                                onTap: () {
                                                                  updatecreditcontroller
                                                                          .text =
                                                                      model
                                                                          .cHourse!;
                                                                  updatetitlecontroller
                                                                          .text =
                                                                      model
                                                                          .title!;
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        content:
                                                                            Container(
                                                                          height:
                                                                              height * 0.4,
                                                                          width:
                                                                              width * 0.3,
                                                                          color:
                                                                              Colors.white,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Container(
                                                                                width: width,
                                                                                height: height * 0.06,
                                                                                alignment: Alignment.center,
                                                                                child: const Text(
                                                                                  "Update Cource",
                                                                                  style: TextStyle(
                                                                                    fontSize: 19,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    color: Color.fromARGB(255, 1, 35, 70),
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
                                                                              CustomTxtfield(height: height * 0.07, width: width * 0.26, hintText: "Course Title", inputType: TextInputType.text, controller: updatetitlecontroller),
                                                                              SizedBox(
                                                                                height: height * 0.02,
                                                                              ),
                                                                              CustomTxtfield(height: height * 0.07, width: width * 0.26, hintText: "Credit Hours", inputType: TextInputType.text, controller: updatecreditcontroller),
                                                                              SizedBox(
                                                                                height: height * 0.02,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  FirebaseFirestore.instance.collection("Cources").doc(model.courceId).update({
                                                                                    "cHourse": updatecreditcontroller.text,
                                                                                    "title": updatetitlecontroller.text
                                                                                  });
                                                                                  MyFlushBar.showSimpleFlushBar("Update Successfully", context, Colors.green, Colors.white);
                                                                                  Future.delayed(Duration(seconds: 2), () {
                                                                                    Navigator.pop(context);
                                                                                  });
                                                                                },
                                                                                child: Container(
                                                                                  height: height * 0.07,
                                                                                  width: width * 0.25,
                                                                                  decoration: BoxDecoration(color: const Color.fromARGB(255, 1, 35, 70), borderRadius: BorderRadius.circular(10)),
                                                                                  alignment: Alignment.center,
                                                                                  child: Text(
                                                                                    "Update Course",
                                                                                    style: TextStyle(fontSize: width * 0.015, fontWeight: FontWeight.w500, color: Colors.white),
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
                                                                child: Icon(
                                                                    Icons
                                                                        .edit)),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class SemesterCard extends StatelessWidget {
  final int semesterData;
  final VoidCallback onEdit;

  SemesterCard({required this.semesterData, required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onEdit,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 48, 96),
                borderRadius: BorderRadius.circular(10)),
            child: Text('Semester ${semesterData}',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
