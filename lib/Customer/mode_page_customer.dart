import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class ModePageCustomer extends StatelessWidget {
  const ModePageCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(222, 255, 249, 1),
        body: Column(
          children: [
            MyAppBar(),

            //morning mode
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
                              Icons.cloud,
                              size: 50,
                            ),
                            Text(
                              "Morning mode",
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
                ),
              ),
            ),

            //Afternonn mode
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
                              Icons.wb_sunny,
                              size: 50,
                            ),
                            Text(
                              "Afternoon mode",
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
                ),
              ),
            ),

            //night mode
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
                              Icons.nights_stay,
                              size: 50,
                            ),
                            Text(
                              "Night mode",
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
