import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class DetailServicePage extends StatelessWidget {
  final int id;

  const DetailServicePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            MyAppBar(value: true),
            Text(
              "Service Name",
              style: TextStyle(fontSize: 25),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 5.0, bottom: 5, left: 5),
                          child: Text(
                            "Customer ${id + 1}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.delete),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
