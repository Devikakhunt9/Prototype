import 'package:flutter/material.dart';
import 'package:prototype/Admin/customer_page_admin.dart';
import 'package:prototype/Admin/home_page_admin.dart';
import 'package:prototype/Admin/service_page_admin.dart';
import 'package:prototype/Customer/group_page_customer.dart';
import 'package:prototype/Customer/home_page_customer.dart';
import 'package:prototype/Customer/mode_page_customer.dart';
import 'package:prototype/profile_page.dart';

class NavigatorPage extends StatefulWidget {
  final int value;

  NavigatorPage({super.key, required this.value});
//1 for admin 0 for customer
  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  int selectedIndex = 0;
  // int value = 0;
  List<Widget> widgetListAdmin = [
    const HomePageAdmin(),
    const CustomerPageAdmin(),
    const ServicePageAdmin(),
    const ProfilePage()
  ];
  List<Widget> widgetListCustomer = [
    const HomePageCustomer(),
    const ModePageCustomer(),
    const GroupPageCustomer(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widget.value == 1
            ? widgetListAdmin[selectedIndex]
            : widgetListCustomer[selectedIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BottomNavigationBar(
            items: [
              //Home ICON
              BottomNavigationBarItem(
                icon: const Icon(
                  Icons.home_rounded,
                  size: 35,
                ),
                label: "Home",
                activeIcon: selectedIndex == 0
                    ? ClipOval(
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.teal.shade400,
                          child: const Icon(
                            Icons.home_rounded,
                            size: 35,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.home_rounded,
                        size: 35,
                      ),
              ),

              //CUstomer
              BottomNavigationBarItem(
                icon: widget.value == 1
                    ? const Icon(
                        Icons.people_alt_rounded,
                        size: 35,
                      )
                    : Icon(
                        Icons.wb_twilight_rounded,
                        size: 35,
                      ),
                label: "Customer",
                activeIcon: selectedIndex == 1
                    ? ClipOval(
                        child: Container(
                          height: 50,
                          width: 50,
                          color: Colors.teal.shade400,
                          child: widget.value == 1
                              ? const Icon(
                                  Icons.people_alt_rounded,
                                  size: 35,
                                )
                              : Icon(
                                  Icons.wb_twilight_rounded,
                                  size: 35,
                                ),
                        ),
                      )
                    : Icon(
                        Icons.people_alt_rounded,
                        size: 35,
                      ),
              ),

              //Service
              BottomNavigationBarItem(
                icon: widget.value == 1
                    ? const Icon(
                        Icons.construction_rounded,
                        size: 35,
                      )
                    : Icon(
                        Icons.group_work_rounded,
                        size: 35,
                      ),
                label: "Services",
                activeIcon: ClipOval(
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.teal.shade400,
                    child: widget.value == 1
                        ? const Icon(
                            Icons.construction_rounded,
                            size: 35,
                          )
                        : Icon(
                            Icons.group_work_outlined,
                            size: 35,
                          ),
                  ),
                ),
              ),

              //my Profile
              BottomNavigationBarItem(
                  icon: const Icon(
                    Icons.person_rounded,
                    size: 35,
                  ),
                  label: "Profile",
                  activeIcon: ClipOval(
                    child: Container(
                      height: 50,
                      width: 50,
                      color: Colors.teal.shade400,
                      child: const Icon(
                        Icons.person_rounded,
                        size: 35,
                      ),
                    ),
                  )),
            ],
            onTap: (index) {
              setState(
                () {
                  selectedIndex = index;
                },
              );
            },
            backgroundColor: Colors.teal.shade200,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
