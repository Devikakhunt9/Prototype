import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prototype/Admin/detail_customer_page_admin.dart';
import 'package:prototype/Admin/detail_edit_customer_page.dart';
import 'package:prototype/widget/MyAppBar_widget.dart';
import 'package:http/http.dart' as http;

class CustomerPageAdmin extends StatefulWidget {
  const CustomerPageAdmin({super.key});

  @override
  State<CustomerPageAdmin> createState() => _CustomerPageAdminState();
}

class _CustomerPageAdminState extends State<CustomerPageAdmin> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 255, 249, 1),
      body: Container(
        child: Column(
          children: [
            MyAppBar(value: false),
            Expanded(
              child: FutureBuilder(
                future: customerList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!['data'].length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                child: Text(
                                  snapshot.data!['data'][index]['userName']
                                      .toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return DetailCustomer(
                                          id: index,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: Icon(Icons.edit),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return DetailEditCustomerPage(
                                                  id: index);
                                            },
                                          ),
                                        );
                                      },
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
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),

              // child: ListView.builder(
              //   itemBuilder: (context, index) {
              //     return Row(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Expanded(
              //           child: Container(
              //             padding: const EdgeInsets.only(top: 8),
              //             child: Card(
              //               child: Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   InkWell(
              //                     child: Text(
              //                       " Customer ${index + 1}",
              //                       style: TextStyle(fontSize: 20),
              //                     ),
              //                     onTap: () {
              //                       Navigator.of(context).push(
              //                         MaterialPageRoute(
              //                           builder: (context) {
              //                             return DetailCustomer(
              //                               id: index,
              //                             );
              //                           },
              //                         ),
              //                       );
              //                     },
              //                   ),
              //                   Row(
              //                     children: [
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: InkWell(
              //                           child: Icon(Icons.edit),
              //                           onTap: () {
              //                             Navigator.of(context).push(
              //                               MaterialPageRoute(
              //                                 builder: (context) {
              //                                   return DetailEditCustomerPage(
              //                                       id: index);
              //                                 },
              //                               ),
              //                             );
              //                           },
              //                         ),
              //                       ),
              //                       Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Icon(Icons.delete),
              //                       )
              //                     ],
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     );
              //   },
              //   itemCount: 15,
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> customerList() async {
    print("function called");
    final String ip = '192.168.12.238:801';
    final String apiUrl = 'http://$ip/CustomerList/customerList';
    final Uri uri = Uri.parse('$apiUrl');
    try {
      final response = await http.get(uri);
      print("MTREITAL PAGE ORUNT BLEOWWWWWWWWWWWWWWWWWWWWWW");
      if (response.statusCode == 200) {
        // showPopup(context, jsonDecode(response.body.toString())['msg'],
        //     jsonDecode(response.body.toString())['user-type']);
        print(response.body.toString());
        return jsonDecode(response.body.toString());
      } else {
        throw Exception(
            'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Network error: $error');
    }
  }
}
