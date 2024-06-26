import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mybzu/model/fee_model.dart';
import 'package:mybzu/uttils/confirm_dialog.dart';
import 'package:mybzu/view/student/DashBoard/dashboard.dart';

class FeeVoucher extends StatefulWidget {
  const FeeVoucher({super.key});

  @override
  State<FeeVoucher> createState() => _FeeVoucherState();
}

class _FeeVoucherState extends State<FeeVoucher> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          'Fee Voucher',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Voucher')
                // .where("smester", isEqualTo: index + 1)
                .snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return SizedBox(
                height: height,
                width: width,
                child: snapshot.data == null
                    ? const Center(child: Text("No Data Found"))
                    : ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          FeeModel model = FeeModel.fromMap(
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>);
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 4.0,
                              right: 4.0,
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              elevation: 20,
                              shadowColor: Colors.white,
                              child: Container(
                                height: height * 0.28,
                                width: width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      height: height * 0.03,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.06,
                                          ),
                                          const Text(
                                            "Title:",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            model.title!,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromARGB(
                                                  255, 173, 168, 173),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.03,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.06,
                                          ),
                                          const Text(
                                            "Challan No:",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            model.challanNo!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 173, 168, 173)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.03,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.06,
                                          ),
                                          const Text(
                                            "Due Date:",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            model.dueDate!,
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 173, 168, 173)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.03,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.06,
                                          ),
                                          const Text(
                                            "Amount:",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: width * 0.02,
                                          ),
                                          Text(
                                            "${model.ammount} (PKR)",
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromARGB(
                                                    255, 173, 168, 173)),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.03,
                                      width: width,
                                      color: Colors.white,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: width * 0.06,
                                          ),
                                          const Text(
                                            "Status:",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                          SizedBox(
                                            width: width * 0.01,
                                          ),
                                          const Text(
                                            "Paid",
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      height: height * 0.056,
                                      width: width * 0.7,
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 0, 47, 95),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                        child: Text(
                                          "Download",
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: Color.fromARGB(
                                                255, 229, 173, 50),
                                          ),
                                        ),
                                      ),
                                    )
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
    );
  }
}
