import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class GroupPageCustomer extends StatelessWidget {
  const GroupPageCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyAppBar(),

          //services
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 20,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Card(
                      child: Center(
                          child: Text(
                    "${index}",
                    style: TextStyle(fontSize: 30),
                  )));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
