import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class AddServicePage extends StatefulWidget {
  final int? id;
  const AddServicePage({super.key, this.id});

  @override
  State<AddServicePage> createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController service = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            //AppBar
            MyAppBar(value: true),
            //Add Service
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "enter Service Name";
                    }
                    return null;
                  },
                  style: TextStyle(color: Colors.teal.shade400),
                  cursorColor: Colors.teal.shade400,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade50,
                    hintText: widget.id == null ? "Add Service" : "abc",
                    // hintStyle:
                    //     const TextStyle(fontFamily: 'Itim', color: Colors.grey),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal.shade400),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal.shade400),
                    ),
                  ),
                ),
              ),
            ),
            //Button Add Service
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
                        child: widget.id == null
                            ? Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )
                            : Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
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
          ],
        ),
      ),
    );
  }
}
