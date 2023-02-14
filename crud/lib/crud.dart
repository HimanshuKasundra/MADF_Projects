import 'package:crud/add_user_page.dart';
import 'package:flutter/material.dart';

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
            child: Icon(Icons.add,color: Colors.white),
          )
        ],
      ),
          body: FutureBuilder(builder: builder),
    ));
  }
}
