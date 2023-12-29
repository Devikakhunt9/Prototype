import 'package:flutter/material.dart';
import 'package:prototype/change_pass_page.dart';
import 'package:prototype/main.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyAppBar(value: true),
          // AppBar(),
          Container(
            child: Column(
              children: [
                Container(
                  // color: Colors.yellow,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // color: Colors.white,
                          // child: Text("Photo"),
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
                                    "Devika A. Khunt",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Colors.teal.shade400),
                                  ),
                                ),
                                Container(
                                  // color: Colors.orange,
                                  child: Text(
                                    "devika123@gmail.com",
                                    style:
                                        TextStyle(color: Colors.teal.shade400),
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
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return ChangePass();
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "change Password",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MyApp();
                        },
                      ),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Log Out",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
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
