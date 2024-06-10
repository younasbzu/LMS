import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mybzu/model/contact_us_model.dart';

class Contact_Us extends StatefulWidget {
  const Contact_Us({super.key});

  @override
  State<Contact_Us> createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: height * 0.07,
              width: width,
              alignment: Alignment.center,
              child: const Text(
                "Contect Us",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
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
              height: height * 0.02,
            ),
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Contacts')
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
                                  ContactModel model = ContactModel.fromMap(
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>);

                                  return Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    elevation: 20,
                                    shadowColor: Colors.white,
                                    child: Container(
                                      height: height * 0.2,
                                      width: width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color:
                                            const Color.fromARGB(255, 0, 48, 96)
                                                .withOpacity(0.2),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Expanded(
                                                child: SizedBox(
                                              height: height,
                                              width: width,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Expanded(
                                                      child: Center(
                                                          child: Text(
                                                    model.name!,
                                                    style: const TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 1, 35, 70),
                                                    ),
                                                  ))),
                                                  Expanded(
                                                      child: Center(
                                                          child: Text(
                                                    model.email!,
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 1, 35, 70),
                                                    ),
                                                  ))),
                                                  Expanded(
                                                      child: Center(
                                                          child: Text(
                                                    model.depart!,
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 1, 35, 70),
                                                    ),
                                                  ))),
                                                ],
                                              ),
                                            )),
                                            Expanded(
                                                child: Container(
                                              height: height,
                                              width: width,
                                              alignment: Alignment.centerLeft,
                                              child: Text(model.msg!),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
