import 'package:flutter/material.dart';
import 'package:prototype/Admin/add_customer_page.dart';
import 'package:prototype/Admin/add_service_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class HomePageAdmin extends StatelessWidget {
  const HomePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyAppBar(value: false),
          // AppBar(),
          Container(
            child: Expanded(
              child: Column(
                children: [

                  //Add Cusomter
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Card(
                          elevation: 10,
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.person_add,
                                    size: 50,
                                  ),
                                  Text(
                                    "Add Customer",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            // color: Colors.yellow,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //set border radius more than 50% of height and width to make circle
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddCustomerPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),


                  //Add Service
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Card(
                          elevation: 10,
                          child: Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.construction,
                                    size: 50,
                                  ),
                                  Text(
                                    "Add Service",
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                            // color: Colors.yellow,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //set border radius more than 50% of height and width to make circle
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AddServicePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
