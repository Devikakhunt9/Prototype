import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  TextEditingController feedback = new TextEditingController();
  GlobalKey<FormState> formkey = new GlobalKey<FormState>();
  int strL = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(222, 255, 249, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              MyAppBar(),

              //feedback box
              Container(
                margin: EdgeInsets.only(top: 10, left: 8, right: 8),
                height: 310,
                width: 500,
                child: Card(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            key: formkey,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  strL = value.length;
                                });
                              },
                              controller: feedback,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your FeedBack";
                                }
                                if (value.length > 350 && value.isNotEmpty) {
                                  return "you can send feedback in atleast 350 charecters.";
                                }
                                return null;
                              },
                              maxLines: 14,
                              decoration: InputDecoration(
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade400)),
                                fillColor: Colors.white,
                                // hintTextDirection: TextDirection.values[rbl],
                                hintText: "feedback",
                                hintStyle: TextStyle(
                                    fontFamily: 'Itim',
                                    color: Colors.grey,
                                    fontSize: 15),
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade400)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.teal.shade400)),
                              ),
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(350)
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            "${strL}/350",
                            // textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //submit button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DecoratedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: InkWell(
                      child: Text(
                        "submit",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          Navigator.of(context).pop();
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
        ),
      ),
    );
  }
}
