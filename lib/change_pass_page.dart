import 'package:flutter/material.dart';
import 'package:prototype/forgot_password_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';
import 'package:prototype/widget/navigator_widget.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  String? oldPass;
  String? newPass;
  String? ErrorMsg = "Enter new Pass";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(value: true),

              //old password
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 35, 18, 0),
                child: TextFormField(
                  controller: oldpass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      // oldPass = value;
                      return "Enter Old password";
                    }
                    if (value.isNotEmpty) {
                      oldPass = value;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.teal.shade400),
                  cursorColor: Colors.teal.shade400,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(222, 255, 249, 1),
                    hintText: "Old PassWord",
                    hintStyle: TextStyle(
                        fontFamily: 'Itim', color: Colors.grey, fontSize: 15),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400)),
                  ),
                ),
              ),

              //new password
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 35, 18, 0),
                child: TextFormField(
                  controller: newpass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return ErrorMsg;
                    }
                    if (value.isNotEmpty) {
                      newPass = value;
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.teal.shade400),
                  cursorColor: Colors.teal.shade400,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(222, 255, 249, 1),
                    hintText: "New Password",
                    hintStyle: TextStyle(
                        fontFamily: 'Itim', color: Colors.grey, fontSize: 15),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400)),
                  ),
                ),
              ),

              //confirm password
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 35, 18, 0),
                child: TextFormField(
                  controller: confirmpass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter confirm password";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.teal.shade400),
                  cursorColor: Colors.teal.shade400,
                  decoration: InputDecoration(
                    fillColor: Color.fromRGBO(222, 255, 249, 1),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                        fontFamily: 'Itim', color: Colors.grey, fontSize: 15),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal.shade400)),
                  ),
                ),
              ),

              //submit button
              Row(
                children: [
                  InkWell(
                    child: Container(
                      child: DecoratedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      // padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(left: 18, right: 18, top: 20),
                    ),
                    onTap: () {
                      if (oldPass == newpass) {
                        setState(() {
                          print("${oldPass}${newPass}");
                          ErrorMsg =
                              "old password nad new  password must not be same";
                        });
                      } else if (formkey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return NavigatorPage(
                                value: 1,
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),

                  //forgot pass button
                  Container(
                    margin: EdgeInsets.only(right: 18, top: 20),
                    padding: EdgeInsets.all(8),
                    child: DecoratedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ForgotPassPage();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade400,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    // margin: EdgeInsets.only(left: 18,right: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
