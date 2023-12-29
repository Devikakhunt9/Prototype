import 'package:flutter/material.dart';
import 'package:prototype/otp_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({super.key});

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            MyAppBar(value: true),

            //user name
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 35, 18, 0),
              child: TextFormField(
                controller: username,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your UserName";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.teal.shade400),
                cursorColor: Colors.teal.shade400,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  errorStyle: TextStyle(color: Colors.red),
                  fillColor: Color.fromRGBO(222, 255, 249, 1),
                  hintText: "User Name",
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

            //email
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 35, 18, 15),
              child: TextFormField(
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Your EMail";
                  }
                  return null;
                },
                style: TextStyle(color: Colors.teal.shade400),
                cursorColor: Colors.teal.shade400,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  fillColor: Color.fromRGBO(222, 255, 249, 1),
                  hintText: "Email",
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
                margin: EdgeInsets.only(left: 18, right: 18),
              ),
              onTap: () {
                if (formkey.currentState!.validate()) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return OTPPage();
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
