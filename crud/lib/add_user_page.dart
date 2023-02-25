import 'package:crud/user_model.dart';
import 'package:flutter/material.dart';

import 'base_client.dart';

class AddUser extends StatefulWidget {
  // AddUser({Key? key}) : super(key: key);
  AddUser(this.map);

  Map? map;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  void initState() {
    super.initState();
    nameController.text = widget.map == null ? "" : widget.map!['name'];
    cityController.text = widget.map == null ? "" : widget.map!['city'];
    idController.text = widget.map == null ? "" : widget.map!['id'];
  }

  final _formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var cityController = TextEditingController();
  var idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Add User Page")),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Enter a name :"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter a valid name";
                  }
                },
                controller: nameController,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter a id :"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter a valid id";
                  }
                },
                controller: idController,
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter a city :"),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter a valid city";
                  }
                },
                controller: cityController,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        if (widget.map == null) {
                          var user = User(
                            name: nameController.text,
                            city: cityController.text,
                            id: idController.text,
                            map: null,
                          );
                          BaseClient()
                              .postData(user)
                              .then((value) => Navigator.of(context).pop(true));
                        } else {
                          var user = User(
                            name: nameController.text,
                            city: cityController.text,
                            id: idController.text,
                          );
                          BaseClient().putData(user, widget.map!['id']).then(
                                (value) => Navigator.of(context).pop(true),
                              );
                        }
                      }
                    });
                  },
                  child: widget.map == null ? Text("Submit") : Text("Edit"),
                // style: ButtonStyle(),
              )
            ],
          )),
    ));
  }

// Future<void> updateUser(id) async {
//   Map map = {};
//   map['name'] = nameController.text;
//   map['id'] = idController.text;
//   map['city'] = cityController.text;
//
//   var response1 = await http.put(
//       Uri.parse("https://63ecf35532a0811723a5b048.mockapi.io/UserList/$id"),
//       body: map);
//   print(response1.body);
// }
}
