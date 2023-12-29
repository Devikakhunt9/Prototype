import 'package:flutter/material.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';

class DeviceLog extends StatelessWidget {
  const DeviceLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Column(
          children: [
            MyAppBar(),

            //database
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 1),
                          left: BorderSide(width: 1),
                          right: BorderSide(width: 1),
                          bottom: index == 9
                              ? BorderSide(width: 1)
                              : BorderSide(width: 0)),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(width: 1))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "data  ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(width: 1))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "data  ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(width: 1))),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "data  ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                border: Border(right: BorderSide(width: 1))),
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  "data  ",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
