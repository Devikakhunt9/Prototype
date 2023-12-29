import 'package:flutter/material.dart';
import 'package:prototype/Admin/add_service_page.dart';
import 'package:prototype/Admin/detail_service_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class ServicePageAdmin extends StatelessWidget {
  const ServicePageAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MyAppBar(value: false),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 8),
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailServicePage(
                                          id: index,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  " Service ${index + 1}",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AddServicePage(id: index),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(Icons.edit),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.delete),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
