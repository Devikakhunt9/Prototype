import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class DetailCustomer extends StatelessWidget {
  final int id;

  DetailCustomer({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyAppBar(value: true),
            Row(
              children: [
                Expanded(
                  child: CircleAvatar(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "Add Photo",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.grey,
                    radius: 50,
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      // color: Colors.green,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // color: Colors.pink,
                            child: Text(
                              "Customer ${id + 1}",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.teal.shade400),
                            ),
                          ),
                          Container(
                            // color: Colors.orange,
                            child: Text(
                              "Customer${id + 1}@gmail.com",
                              style: TextStyle(color: Colors.teal.shade400),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  flex: 11,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.lightbulb_rounded,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.wind_power_rounded,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.family_restroom_rounded,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.sunny_snowing,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.sunny,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.nights_stay,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.alarm_on_rounded,
                              size: 75,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.feed_rounded,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Icon(
                              Icons.dataset,
                              size: 75,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
