import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  final bool? value;

  MyAppBar({this.value});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.teal.shade400,
      title: value == true
          ? Text("Zugma Automation")
          : Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("Zugma Automation"),
            ),
      leading: value == true
          ? InkWell(
              onTap: () {
                Navigator.of(context).pop(true);
              },
              child: Icon(Icons.arrow_back),
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.person_pin,
            size: 35,
          ),
        )
      ],
    );
  }
}
