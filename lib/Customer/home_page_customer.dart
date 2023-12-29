import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prototype/Customer/database_customer_device_log_page.dart';
import 'package:prototype/Customer/feedback_customer_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class HomePageCustomer extends StatefulWidget {
  const HomePageCustomer({super.key});

  @override
  State<HomePageCustomer> createState() => _HomePageCustomerState();
}

class _HomePageCustomerState extends State<HomePageCustomer> {
  List stringList = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k'];
  TextEditingController feedback = new TextEditingController();
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyAppBar(),

          //services
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 100,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  return Card(
                      child: Center(
                          child: Text(
                    "${index}",
                    style: TextStyle(fontSize: 30),
                  )));
                },
              ),
            ),
          ),

          //databae and feedback button
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Card(
                      child: Center(
                        child: Text(
                          "database",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DeviceLog();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: InkWell(
                    child: Card(
                      child: Center(
                        child: Text(
                          "feedback",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return FeedBackPage();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
