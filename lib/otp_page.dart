import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prototype/login_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  TextEditingController textformfiled1 = TextEditingController();
  TextEditingController textformfiled2 = TextEditingController();
  TextEditingController textformfiled3 = TextEditingController();
  TextEditingController textformfiled4 = TextEditingController();

  FocusNode texteditingfocusnode1 = FocusNode();
  FocusNode texteditingfocusnode2 = FocusNode();
  FocusNode texteditingfocusnode3 = FocusNode();
  FocusNode texteditingfocusnode4 = FocusNode();
  FocusNode submit = FocusNode();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                MyAppBar(value: true),
                Container(
                  // color: Colors.pink,
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(top: 200),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //otp mssg
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SizedBox(
                              width: 50,
                              child: TextFormField(
                                controller: textformfiled1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter OTP";
                                  }
                                  return null;
                                },
                                focusNode: texteditingfocusnode1,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    FocusScope.of(context)
                                        .requestFocus(texteditingfocusnode2);
                                  });
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal.shade400),
                                  ),
                                ),
                                autofocus: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SizedBox(
                              width: 50,
                              child: TextFormField(
                                controller: textformfiled2,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter OTP";
                                  }
                                },
                                focusNode: texteditingfocusnode2,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    FocusScope.of(context)
                                        .requestFocus(texteditingfocusnode3);
                                  });
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal.shade400),
                                  ),
                                ),
                                autofocus: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SizedBox(
                              width: 50,
                              child: TextFormField(
                                controller: textformfiled3,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter OTP";
                                  }
                                },
                                focusNode: texteditingfocusnode3,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    FocusScope.of(context)
                                        .requestFocus(texteditingfocusnode4);
                                  });
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal.shade400),
                                  ),
                                ),
                                autofocus: true,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: SizedBox(
                              width: 50,
                              child: TextFormField(
                                controller: textformfiled4,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Enter OTP";
                                  }
                                },
                                focusNode: texteditingfocusnode4,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(1)
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    FocusScope.of(context).requestFocus(submit);
                                  });
                                },
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.teal.shade400),
                                  ),
                                ),
                                autofocus: true,
                              ),
                            ),
                          ),
                        ],
                      ),

                      //submit button
                      Container(
                        child: DecoratedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              child: Text(
                                "submit",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  /// Fill webOrigin only when your new origin is different than the app's origin
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Login_Page();
                                      },
                                    ),
                                  );
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
