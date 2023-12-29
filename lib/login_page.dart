import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prototype/forgot_password_page.dart';
import 'package:prototype/widget/navigator_widget.dart';
import 'package:http/http.dart' as http;

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool obsecuretxt = true;
  int ans = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(222, 255, 249, 1),
        body: Form(
          key: formkey,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //LOGO Zugma Automation
                        AspectRatio(
                          aspectRatio: 16 / 5,
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.scaleDown,
                                image: AssetImage("assets/images/DashIcon.png"),
                              ),
                            ),
                          ),
                        ),

                        //Flied UserName
                        Padding(
                          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Name';
                              }

                              return null;
                            },
                            controller: username,
                            style: TextStyle(color: Colors.teal.shade400),
                            cursorColor: Colors.teal.shade400,
                            decoration: InputDecoration(
                              errorBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade400)),
                              fillColor: Color.fromRGBO(222, 255, 249, 1),
                              hintText: "User Name",
                              hintStyle: TextStyle(
                                  fontFamily: 'Itim',
                                  color: Colors.grey,
                                  fontSize: 15),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade400)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.teal.shade400)),
                            ),
                          ),
                        ),

                        //field Enter PassWord
                        Padding(
                          padding: const EdgeInsets.all(18),
                          child: TextFormField(
                            controller: password,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "please Enter your passowrd";
                              }
                              return null;
                            },
                            style: TextStyle(color: Colors.teal.shade400),
                            cursorColor: Colors.teal.shade400,
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                child: obsecuretxt
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onTap: () {
                                  setState(() {
                                    obsecuretxt = !obsecuretxt;
                                  });
                                },
                              ),
                              fillColor: Color.fromRGBO(222, 255, 249, 1),
                              hintText: "Pass word",
                              hintStyle: TextStyle(
                                fontFamily: 'Itim',
                                color: Colors.grey,
                              ),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal.shade400),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.teal.shade400),
                              ),
                            ),
                            obscureText: obsecuretxt,
                          ),
                        ),

                        // Buttons Login & Forget PassWord
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //login button
                            Container(
                              child: DecoratedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                    onTap: () {
                                      if (formkey.currentState!.validate()) {
                                        // FutureBuilder(
                                        //   future:
                                        //     .then((value) {
                                        //   return Navigator.of(context).push(
                                        //     MaterialPageRoute(
                                        //       builder: (context) {
                                        //         return NavigatorPage(
                                        //             value:
                                        //                 value["user-type"] ==
                                        //                         1
                                        //                     ? 1
                                        //                     : 0);
                                        //       },
                                        //     ),
                                        //   );
                                        // })
                                        isAuthorized(
                                            username.text, password.text);
                                        //     .then((value) {
                                        //   return Navigator.of(context)
                                        //       .push(MaterialPageRoute(
                                        //     builder: (context) {
                                        //       return NavigatorPage(
                                        //           value: value['user-type'] == 1
                                        //               ? 1
                                        //               : 0);
                                        //     },
                                        //   ));
                                        // });
                                        // showSuccessAlert(context);
                                        // isAuthorized(
                                        //     username.text, password.text);
                                        // builder: (context, snapshot) {
                                        //   if (snapshot.hasData) {
                                        //     return Text("123");
                                        //     //
                                        //   } else {
                                        //     return CircularProgressIndicator();
                                        //   }
                                        // },
                                        // );
                                        // isAuthorized(
                                        //         username.text, password.text)
                                        //     .then(
                                        //   (value) =>
                                        // );
                                      }
                                    },
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade400,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              // padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 18, right: 18),
                            ),

                            //forgot password button
                            Container(
                              child: DecoratedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
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

                            // TextButton(
                            //   onPressed: () async {
                            //     return await showDialog(
                            //       barrierColor: Colors.white,
                            //       context: context,
                            //       builder: (context) {
                            //         return Container(
                            //           margin: EdgeInsets.only(
                            //               top: 10, left: 8, right: 8),
                            //           height: 31,
                            //           width: 50,
                            //           child: Padding(
                            //               padding: const EdgeInsets.all(8.0),
                            //               child: Text("Data")),
                            //         );
                            //       },
                            //     );
                            //   },
                            //   child: Text("Login"),
                            // )
                          ],
                        ),
                        //button
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showPopup(BuildContext context, String message, int user_type) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Login Status"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (user_type == 1 || user_type == 2) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return NavigatorPage(value: user_type == 1 ? 1 : 0);
                      },
                    ),
                  );
                } else {
                  return Navigator.of(context).pop();
                }
                // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> isAuthorized(String parameter1, String parameter2) async {
    print("function called");
    final String ip = '192.168.12.238:801';
    final String apiUrl = 'http://$ip/Login/authorizedUser';
    final Uri uri = Uri.parse('$apiUrl/$parameter1/$parameter2');
    try {
      final response = await http.get(uri);
      print("MTREITAL PAGE ORUNT BLEOWWWWWWWWWWWWWWWWWWWWWW");
      if (response.statusCode == 200) {
        showPopup(context, jsonDecode(response.body.toString())['msg'],
            jsonDecode(response.body.toString())['user-type']);
        print(response.body.toString());
        return jsonDecode(response.body.toString());
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Network error: $error');
    }
  }
}
