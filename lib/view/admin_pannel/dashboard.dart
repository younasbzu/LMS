import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mybzu/uttils/flushbar.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/admin_page.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/all_users.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/campus_Page.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/contact_us.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/depart_page.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/fee_voucher_screen.dart';
import 'package:mybzu/view/admin_pannel/admin_pages/plan_of_study.dart';
import 'package:mybzu/view/admin_pannel/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPanel extends StatefulWidget {
  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AllUsers(),
    const Admin_Depart_Page(),
    const CampusPage(),
    const AdminInfoPage(),
    Plan_of_Study(),
    const FeeVoucher(),
    // const Edit_Profile(),
    const Contact_Us(),
    // // const AccountStatment(),
    // // Transport_Screen(),
    // // const Forgot_Screen(),
    // // const CurrentEnrollment(),
    // TimetableScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onDropdownItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          children: <Widget>[
            Container(
              width: width * 0.2,
              color: const Color.fromARGB(255, 0, 48, 96),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: width * 0.15,
                      height: height * 0.09,
                      color: const Color.fromARGB(255, 0, 48, 96),
                      child: const Center(
                        child: Text(
                          'My BZU',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                    ),
                    ListTile(
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: const Text(
                        'All Users',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () => _onDropdownItemSelected(0),
                    ),
                    ListTile(
                      leading: const Icon(Icons.school, color: Colors.white),
                      title: const Text(
                        'Department',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () => _onDropdownItemSelected(1),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.location_city, color: Colors.white),
                      title: const Text(
                        'Campuses',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () => _onDropdownItemSelected(2),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.contact_page, color: Colors.white),
                      title: const Text(
                        'Admins',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      onTap: () => _onDropdownItemSelected(3),
                    ),
                    ListTile(
                      leading: const Icon(Icons.book, color: Colors.white),
                      title: const Text(
                        'Plan of study',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      selected: _selectedIndex == 4,
                      onTap: () => _onItemTapped(4),
                    ),
                    ListTile(
                      leading: const Icon(Icons.account_balance_wallet,
                          color: Colors.white),
                      title: const Text(
                        'Fee Voucher',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      selected: _selectedIndex == 5,
                      onTap: () => _onItemTapped(5),
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.place_rounded, color: Colors.white),
                      title: const Text(
                        'Contact_Us',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      selected: _selectedIndex == 6,
                      onTap: () => _onItemTapped(6),
                    ),
                    // ListTile(
                    //   leading: const Icon(Icons.fence, color: Colors.white),
                    //   title: const Text(
                    //     'Edit Profile',
                    //     style: TextStyle(fontSize: 15, color: Colors.white),
                    //   ),
                    //   selected: _selectedIndex == 6,
                    //   onTap: () => _onItemTapped(6),
                    // ),

                    // ListTile(
                    //   leading: const Icon(Icons.av_timer, color: Colors.white),
                    //   title: const Text(
                    //     'Account Statment',
                    //     style: TextStyle(fontSize: 15, color: Colors.white),
                    //   ),
                    //   selected: _selectedIndex == 8,
                    //   onTap: () => _onItemTapped(8),
                    // ),
                    // ListTile(
                    //   leading:
                    //       const Icon(Icons.directions_bus, color: Colors.white),
                    //   title: const Text(
                    //     'Transport',
                    //     style: TextStyle(fontSize: 15, color: Colors.white),
                    //   ),
                    //   selected: _selectedIndex == 9,
                    //   onTap: () => _onItemTapped(9),
                    // ),
                    // ListTile(
                    //   leading:
                    //       const Icon(Icons.directions_bus, color: Colors.white),
                    //   title: const Text(
                    //     'Forgot_Screen',
                    //     style: TextStyle(fontSize: 15, color: Colors.white),
                    //   ),
                    //   selected: _selectedIndex == 10,
                    //   onTap: () => _onItemTapped(10),
                    // ),
                    // ListTile(
                    //   leading:
                    //       const Icon(Icons.directions_bus, color: Colors.white),
                    //   title: const Text(
                    //     'Current Enrollment',
                    //     style: TextStyle(fontSize: 15, color: Colors.white),
                    //   ),
                    //   selected: _selectedIndex == 11,
                    //   onTap: () => _onItemTapped(11),
                    // ),
                    // ListTile(
                    //   leading:
                    //       const Icon(Icons.directions_bus, color: Colors.white),
                    //   title: const Text(
                    //     'Timetable Screen',
                    //     style: TextStyle(fontSize: 15, color: Colors.white),
                    //   ),
                    //   selected: _selectedIndex == 12,
                    //   onTap: () => _onItemTapped(12),
                    // ),
                    ListTile(
                        leading: const Icon(Icons.logout, color: Colors.white),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        selected: _selectedIndex == 13,
                        onTap: () async {
                          // Obtain shared preferences.
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.remove('id');
                          await prefs.remove('status');
                          // ignore: use_build_context_synchronously
                          MyFlushBar.showSimpleFlushBar("Logout Successfully",
                              context, Colors.red, Colors.white);
                          Timer(Duration.zero, () {
                            Timer(const Duration(seconds: 3), () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Admin_Login_screen()),
                                  (route) => false);
                            });
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                  height: height,
                  width: width,
                  color: const Color.fromARGB(255, 0, 48, 96).withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _pages[_selectedIndex],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
