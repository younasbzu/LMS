import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/cource_model.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';

class Plan_Of_Study extends StatelessWidget {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 48, 96),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Get.off((const Dashboard()));
            }),
        title: const Text(
          'Plan of Study',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          // Other widgets above the tab bar
          Expanded(
            child: DefaultTabController(
              length: 9, // Number of tabs
              child: Column(
                children: [
                  const TabBar(
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    isScrollable: true, // Allow tabs to scroll horizontally
                    tabs: [
                      Tab(
                        text: ' All ',
                      ),
                      Tab(text: 'Semester 1'),
                      Tab(text: 'Semester 2'),
                      Tab(text: 'Semester 3'),
                      Tab(text: 'Semester 4'),
                      Tab(text: 'Semester 5'),
                      Tab(text: 'Semester 6'),
                      Tab(text: 'Semester 7'),
                      Tab(text: 'Semester 8'),
                    ],
                    labelStyle:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        // Contents for each tab
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                // .where("smester", isEqualTo: index + 1)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 1)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 2)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 3)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 4)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 5)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 6)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 7)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                        StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Cources')
                                .where("smester", isEqualTo: 8)
                                .snapshots(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              return SizedBox(
                                height: height,
                                width: width,
                                child: snapshot.data == null
                                    ? const Center(child: Text("No Data Found"))
                                    : ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder: (context, index) {
                                          CourceModel model =
                                              CourceModel.fromMap(snapshot
                                                      .data!.docs[index]
                                                      .data()
                                                  as Map<String, dynamic>);
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: height * 0.07,
                                              width: width,
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                          255, 0, 48, 96)
                                                      .withOpacity(0.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  Container(
                                                    height: height,
                                                    width: width * 0.05,
                                                    alignment: Alignment.center,
                                                    child: Text("${index + 1}"),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      height: height,
                                                      width: width,
                                                      alignment:
                                                          Alignment.centerLeft,
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
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                          "${model.cHourse} Credit Hours"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Other widgets below the tab bar
        ],
      ),
    );
  }
}
