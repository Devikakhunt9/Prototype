import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prototype/Admin/customer_page_admin.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';
import 'package:http/http.dart' as http;
import 'package:prototype/widget/navigator_widget.dart';

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  State<AddCustomerPage> createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  bool obsecuretxt = true;
  bool isChecked = false;

  String errmsg = 'Enter User Name';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Appbar
                MyAppBar(value: true),

                //user Name
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
                  child: TextFormField(
                    controller: username,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return errmsg;
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.teal.shade400),
                    cursorColor: Colors.teal.shade400,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade50,
                      hintText: "User Name",
                      hintStyle:
                          TextStyle(fontFamily: 'Itim', color: Colors.grey),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400)),
                    ),
                  ),
                ),

                //PassWord
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    obscureText: obsecuretxt,
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Tempory User Password";
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
                      fillColor: Colors.grey.shade50,
                      hintText: "Pass word",
                      hintStyle:
                          TextStyle(fontFamily: 'Itim', color: Colors.grey),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400)),
                    ),
                  ),
                ),

                //user email
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: userEmail,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter User Email';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.teal.shade400),
                    cursorColor: Colors.teal.shade400,
                    decoration: InputDecoration(
                      fillColor: Colors.grey.shade50,
                      hintText: "User Email",
                      hintStyle:
                          TextStyle(fontFamily: 'Itim', color: Colors.grey),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal.shade400)),
                    ),
                  ),
                ),

                //checkbox
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      "Yes,this person is Admin.",
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),

                //Button Add Customer
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DecoratedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            child: Text(
                              "Add",
                              style:
                                  TextStyle(fontSize: 25, color: Colors.white),
                            ),
                            onTap: () {
                              // do{addUser();}while(formkey.currentState!.validate());
                              if (formkey.currentState!.validate()) {
                                print("function is called");
                                addUser();
                                // addUser()
                                //     .then(
                                //         (value) => Navigator.of(context).pop())
                                //     .then((value) => showPopup());
                                // Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.teal.shade400,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> addUser() async {
    Map<String, dynamic> map = {};
    map['UserName'] = username.text;
    map['UserPassword'] = password.text;
    map['UserEmail'] = userEmail.text;
    map['IsAdmin'] = isChecked.toString();

    final String ip = '192.168.12.238:801';
    final String apiUrl = 'http://$ip/AddCustomer/Post';
    var res = await http.post(Uri.parse(apiUrl), body: map);
    // print(res.body.toString());
    if (res.statusCode == 400) {
      showPopup(context, jsonDecode(res.body.toString())['msg'],
          jsonDecode(res.body.toString())['status']);
      print(res.body.toString());
    }
    if (res.statusCode == 200) {
      showPopup(context, jsonDecode(res.body.toString())['msg'],
          jsonDecode(res.body.toString())['status']);
      return res;
    }

    // print(res.body);
  }

  void showPopup(BuildContext context, String message, bool value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Login Status"),
          content: Text(
            message,
            style: TextStyle(
                color: value ? Colors.black : Colors.red, fontSize: 25),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                if (value) {
                  Navigator.of(context).pop();
                  return Navigator.of(context).pop();
                }
                return Navigator.of(context).pop();

                // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
