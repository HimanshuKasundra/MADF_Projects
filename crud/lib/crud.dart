import 'package:crud/add_user_page.dart';
import 'package:flutter/material.dart';

import 'base_client.dart';

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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return AddUser(null);
                  },
                )).then((value) {
                  if (value == true) {
                    setState(() {});
                  }
                });
              },
              child: Icon(Icons.add, color: Colors.white),
            ),
          )
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return AddUser(snapshot.data![index]);
                      },
                    )).then((value) {
                      if (value == true) {
                        setState(() {});
                      }
                    });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 10, bottom: 10, right: 10),
                      child: Container(
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,

                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data![index]["name"].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      snapshot.data![index]["city"].toString(),
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Text(
                                      snapshot.data![index]["id"].toString(),
                                      style: TextStyle(color: Colors.black26),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          height: 90,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Are you sure want to Delete?"),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        BaseClient()
                                                            .deleteData(
                                                            snapshot.data![
                                                            index]
                                                            ["id"]).then((value) {
                                                              setState(() {
                                                                BaseClient().getData();
                                                                Navigator.of(context).pop();
                                                              });
                                                        });

                                                      },
                                                      child: Text("Yes"),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                          backgroundColor:
                                                          Colors.red
                                                              .shade800),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          print('no selected');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                        child: Text("No",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black)),
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                          Colors.white,
                                                        ),
                                                      ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                child: Icon(Icons.delete,color: Colors.red,size: 23 ,),),

                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          AddUser(snapshot.data![index])));
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 25,
                                  color: Colors.black26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.length,
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          }
        },
        future: BaseClient().getData(),
      ),
    ));
  }

// String convertDateFromString(String dateToFormat){
//   DateTime date=DateFormat("yyyy-MM-dd'T'hh:mm:ss.SSS'Z'").parse(dateToFormat);
//   return DateFormat("dd-MM-yyyy").format(date);
// }

// Future<List<dynamic>> getDataFromApi() async {
//   http.Response res = await http
//       .get(Uri.parse("https://6315f77133e540a6d3894dc8.mockapi.io/student"));
//   List<dynamic> map = jsonDecode(res.body.toString());
//   // print("Dat ::: ${map}");
//   return map;
// }
// Future<List<dynamic>> updateData(id) async {
//   http.Response res = await http
//       .put(Uri.parse("https://6315f77133e540a6d3894dc8.mockapi.io/student/$id"));
//   List<dynamic> map = jsonDecode(res.body.toString());
//   // print("Dat ::: ${map}");
//   return map;
// }
// Future<void> insertData() async {
//   Map map={};
//   http.Response res = await http
//       .post(Uri.parse("https://6315f77133e540a6d3894dc8.mockapi.io/student"));
//   // print("Dat ::: ${map}");
// }
// Future<List<dynamic>> deleteData(id) async {
//   http.Response res = await http
//       .delete(Uri.parse("https://6315f77133e540a6d3894dc8.mockapi.io/student/$id"));
//   List<dynamic> map = jsonDecode(res.body.toString());
//   // print("Dat ::: ${map}");
//   return map;
// }
}
