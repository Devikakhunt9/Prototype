import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class DetailEditCustomerPage extends StatefulWidget {
  final int id;

  const DetailEditCustomerPage({super.key, required this.id});

  @override
  State<DetailEditCustomerPage> createState() => _DetailEditPageState();
}

class _DetailEditPageState extends State<DetailEditCustomerPage> {
  int roomCounter = 0;
  List listOfCounter = [
    {'name': 'Room', 'Count': 0},
    {'name': 'Light', 'Count': 0},
    {'name': 'Fan', 'Count': 0},
    {'name': 'AC', 'Count': 0},
    {'name': 'TV', 'Count': 0},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MyAppBar(value: true),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.pink,
                          child: Text(
                            "${listOfCounter[index]['name']}",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Container(
                          // color: Colors.orange,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Icon(Icons.remove),
                                onTap: () {
                                  if (listOfCounter[index]['Count'] > 0) {
                                    setState(() {
                                      listOfCounter[index]['Count']--;
                                    });
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 30.0, right: 30),
                                child: Text("${listOfCounter[index]['Count']}"),
                              ),
                              InkWell(
                                child: Icon(Icons.add),
                                onTap: () {
                                  setState(() {
                                    listOfCounter[index]['Count']++;
                                  });
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
