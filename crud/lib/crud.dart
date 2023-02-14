import 'dart:convert';

import 'package:crud/add_user_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Crud extends StatefulWidget {
  const Crud({Key? key}) : super(key: key);

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Crud Api"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AddUser()));
            },
            child: Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: FutureBuilder<Map<String,dynamic>>(
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            return Container(
              child: Text(snapshot.data![''][0]['id'].toString()),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: callApiGet(),
      ),
    ));
  }

  Future<Map<String,dynamic>> callApiGet() async {
    http.Response res = await http
        .get(Uri.parse("https://6315f77133e540a6d3894dc8.mockapi.io/student"));
    Map<String,dynamic> map= jsonDecode(res.body.toString());
    // print("Dat ::: ${res.body.toString()}");
    return map;
  }
}
