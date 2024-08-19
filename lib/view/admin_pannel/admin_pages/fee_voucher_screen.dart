import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mybzu/model/fee_model.dart';
import 'package:mybzu/uttils/custom_txtfield.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:uuid/uuid.dart';

class FeeVoucher extends StatefulWidget {
  const FeeVoucher({super.key});

  @override
  State<FeeVoucher> createState() => _FeeVoucherState();
}

class _FeeVoucherState extends State<FeeVoucher> {
  var height, width;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController challanNocontroller = TextEditingController();
  TextEditingController dueDatecontroller = TextEditingController();
  TextEditingController ammountcontroller = TextEditingController();
  TextEditingController updatetitlecontroller = TextEditingController();
  TextEditingController updatechallanNocontroller = TextEditingController();
  TextEditingController updatedueDatecontroller = TextEditingController();
  TextEditingController updateammountcontroller = TextEditingController();
  TextEditingController updatebankcontroller = TextEditingController();
  TextEditingController updatecardcontroller = TextEditingController();
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
                        "Fee Voucher",
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
                                  height: height * 0.45,
                                  width: width * 0.4,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      Container(
                                        width: width,
                                        height: height * 0.06,
                                        alignment: Alignment.center,
                                        child: const Text(
                                          "Create New Voucher",
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
                                        height: height * 0.1,
                                        width: width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Expanded(
                                              child: CustomTxtfield(
                                                  height: height * 0.07,
                                                  width: width * 0.26,
                                                  hintText: "Title",
                                                  inputType: TextInputType.text,
                                                  controller: titlecontroller),
                                            ),
                                            SizedBox(
                                              width: width * 0.02,
                                            ),
                                            Expanded(
                                              child: CustomTxtfield(
                                                  height: height * 0.07,
                                                  width: width * 0.26,
                                                  hintText: "Ammount",
                                                  inputType: TextInputType.text,
                                                  controller:
                                                      ammountcontroller),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                      Container(
                                        height: height * 0.1,
                                        width: width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CustomTxtfield(
                                                  height: height * 0.07,
                                                  width: width * 0.26,
                                                  hintText: "Challan No",
                                                  inputType: TextInputType.text,
                                                  controller:
                                                      challanNocontroller),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Expanded(
                                              child: Card(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: SizedBox(
                                                  height: height * 0.07,
                                                  width: width,
                                                  child: TextFormField(
                                                    controller:
                                                        dueDatecontroller,
                                                    cursorColor:
                                                        const Color.fromARGB(
                                                            255, 1, 35, 70),
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 1, 35, 70),
                                                    ),
                                                    textInputAction:
                                                        TextInputAction.next,
                                                    onTap: () async {
                                                      final DateTime?
                                                          pickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            DateTime.now(),
                                                        firstDate:
                                                            DateTime(2022),
                                                        lastDate:
                                                            DateTime(2030),
                                                      );
                                                      if (pickedDate != null) {
                                                        dueDatecontroller
                                                            .text = DateFormat(
                                                                'yyyy-MM-dd')
                                                            .format(pickedDate);
                                                      }
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'This field is required';
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          const EdgeInsets
                                                                  .symmetric(
                                                              vertical: 05.0,
                                                              horizontal: 15.0),
                                                      hintText: "Date",
                                                      hintStyle: const TextStyle(
                                                          color: Colors
                                                              .black), // Adjust hint text color here

                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                          color: Color.fromARGB(
                                                              255, 50, 49, 49),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
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
                                          var uid = const Uuid();
                                          String feeId = uid.v4();
                                          FeeModel model = FeeModel(
                                              ammount: ammountcontroller.text,
                                              challanNo:
                                                  challanNocontroller.text,
                                              dueDate: dueDatecontroller.text,
                                              feeId: feeId,
                                              title: titlecontroller.text);
                                          FirebaseFirestore.instance
                                              .collection("Voucher")
                                              .doc(feeId)
                                              .set(model.toMap());
                                          MyFlushBar.showSimpleFlushBar(
                                              "Added Successfully",
                                              context,
                                              Colors.green,
                                              Colors.white);
                                          Future.delayed(
                                              const Duration(seconds: 2), () {
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
                                            "Add Voucher",
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
                            "Create New Voucher",
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
                        .collection('Voucher')
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      return Container(
                        height: height,
                        width: width,
                        color: Colors.white,
                        child: snapshot.data == null
                            ? const Center(child: Text("No Data Found"))
                            : GridView.builder(
                                padding: const EdgeInsets.all(20.0),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  childAspectRatio: 1.8,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 15,
                                ),
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      elevation: 20,
                                      shadowColor: Colors.white,
                                      child: Container(
                                        height: height * 0.31,
                                        width: width * 0.9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                                  255, 0, 48, 96)
                                              .withOpacity(0.2),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              height: height * 0.03,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  const Text(
                                                    "Title:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    "${model.title}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  const Text(
                                                    "Challan No:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    "${model.challanNo}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  const Text(
                                                    "Due Date:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    "${model.dueDate}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  const Text(
                                                    "Amount:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    "${model.ammount} (PKR)",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  const Text(
                                                    "Bank Name:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    "${model.bankname}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                              width: width,
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: width * 0.01,
                                                  ),
                                                  const Text(
                                                    "Card No:",
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(
                                                    width: width * 0.02,
                                                  ),
                                                  Text(
                                                    "${model.cardno}",
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: width * 0.04,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {
                                                  updateammountcontroller.text =
                                                      model.ammount!;
                                                  updatechallanNocontroller
                                                      .text = model.challanNo!;
                                                  updatedueDatecontroller.text =
                                                      model.dueDate!;
                                                  updatetitlecontroller.text =
                                                      model.title!;
                                                  updatebankcontroller.text =
                                                      model.bankname!;

                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        content: Container(
                                                          height: height * 0.45,
                                                          width: width * 0.4,
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
                                                                  "Update Voucher",
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
                                                                    0.1,
                                                                width: width,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    Expanded(
                                                                      child: CustomTxtfield(
                                                                          height: height *
                                                                              0.07,
                                                                          width: width *
                                                                              0.26,
                                                                          hintText:
                                                                              "Title",
                                                                          inputType: TextInputType
                                                                              .text,
                                                                          controller:
                                                                              updatetitlecontroller),
                                                                    ),
                                                                    SizedBox(
                                                                      width: width *
                                                                          0.02,
                                                                    ),
                                                                    Expanded(
                                                                      child: CustomTxtfield(
                                                                          height: height *
                                                                              0.07,
                                                                          width: width *
                                                                              0.26,
                                                                          hintText:
                                                                              "Ammount",
                                                                          inputType: TextInputType
                                                                              .text,
                                                                          controller:
                                                                              updateammountcontroller),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: height *
                                                                    0.02,
                                                              ),
                                                              Container(
                                                                height: height *
                                                                    0.1,
                                                                width: width,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Expanded(
                                                                      child: CustomTxtfield(
                                                                          height: height *
                                                                              0.07,
                                                                          width: width *
                                                                              0.26,
                                                                          hintText:
                                                                              "Challan No",
                                                                          inputType: TextInputType
                                                                              .text,
                                                                          controller:
                                                                              updatechallanNocontroller),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          height *
                                                                              0.02,
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Card(
                                                                        color: Colors
                                                                            .white,
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              height * 0.07,
                                                                          width:
                                                                              width,
                                                                          child:
                                                                              TextFormField(
                                                                            controller:
                                                                                updatedueDatecontroller,
                                                                            cursorColor: const Color.fromARGB(
                                                                                255,
                                                                                1,
                                                                                35,
                                                                                70),
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Color.fromARGB(255, 1, 35, 70),
                                                                            ),
                                                                            textInputAction:
                                                                                TextInputAction.next,
                                                                            onTap:
                                                                                () async {
                                                                              final DateTime? pickedDate = await showDatePicker(
                                                                                context: context,
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime(2022),
                                                                                lastDate: DateTime(2030),
                                                                              );
                                                                              if (pickedDate != null) {
                                                                                updatedueDatecontroller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                                                              }
                                                                            },
                                                                            validator:
                                                                                (value) {
                                                                              if (value == null || value.isEmpty) {
                                                                                return 'This field is required';
                                                                              }
                                                                              return null;
                                                                            },
                                                                            decoration:
                                                                                InputDecoration(
                                                                              contentPadding: const EdgeInsets.symmetric(vertical: 05.0, horizontal: 15.0),
                                                                              hintText: "Date",
                                                                              hintStyle: const TextStyle(color: Colors.black), // Adjust hint text color here

                                                                              enabledBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(
                                                                                  color: Colors.grey,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                              focusedBorder: OutlineInputBorder(
                                                                                borderSide: const BorderSide(
                                                                                  color: Color.fromARGB(255, 50, 49, 49),
                                                                                  width: 1,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(10),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
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
                                                                  FeeModel upmodel = FeeModel(
                                                                      ammount:
                                                                          updateammountcontroller
                                                                              .text,
                                                                      challanNo:
                                                                          updatechallanNocontroller
                                                                              .text,
                                                                      dueDate:
                                                                          updatedueDatecontroller
                                                                              .text,
                                                                      feeId: model
                                                                          .feeId,
                                                                      title: updatetitlecontroller
                                                                          .text,
                                                                      bankname:
                                                                          updatebankcontroller
                                                                              .text);
                                                                  FirebaseFirestore
                                                                      .instance
                                                                      .collection(
                                                                          "Voucher")
                                                                      .doc(model
                                                                          .feeId)
                                                                      .update(upmodel
                                                                          .toMap());
                                                                  MyFlushBar.showSimpleFlushBar(
                                                                      "Added Successfully",
                                                                      context,
                                                                      Colors
                                                                          .green,
                                                                      Colors
                                                                          .white);
                                                                  Future.delayed(
                                                                      const Duration(
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
                                                                    "Update Voucher",
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
                                                child: Container(
                                                  height: height * 0.05,
                                                  width: width * 0.25,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: const Color.fromARGB(
                                                        255, 1, 35, 70),
                                                  ),
                                                  child: const Text(
                                                    "Update",
                                                    style: TextStyle(
                                                        color: Colors.white),
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
            ],
          ),
        ),
      ),
    );
  }
}
