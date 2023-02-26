import 'dart:convert';

import 'package:crud/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
String baseUrl='https://6315f77133e540a6d3894dc8.mockapi.io/student/';
class BaseClient {
  var client = http.Client();

  Future<List<dynamic>> getData() async {
    var url = Uri.parse(baseUrl);
    var response = await client.get(url);
    if (response.statusCode == 200) {
      List<dynamic> map = jsonDecode(response.body.toString());
      // print("data:::${map}");
      return map;
    }
    else {
      Text("Invalid");
      return [];
    }
  }

  Future<User?> postData(dynamic object) async {
    var url = Uri.parse(baseUrl);
    var _payload = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};
    var response = await client.post(url, body: _payload, headers: _headers);
    if (response.statusCode == 200) {
      var json = response.body;
      userFromJson(json);
      return userFromJson(json);
    }
  }

  Future<dynamic> putData(dynamic object, id) async {
    var url = Uri.parse(baseUrl + (id).toString());
    var _payload = json.encode(object);
    var _headers = {'Content-Type': 'application/json'};
    var response = await client.put(url, body: _payload, headers: _headers);
    if (response.statusCode == 201) {
      var json = response.body;
      userFromJson(json);
      return userFromJson(json);
    }
  }

  Future<dynamic> deleteData(id,{dynamic object}) async {
    var url = Uri.parse(baseUrl + (id).toString());
    var _headers = {'Content-Type': 'application/json'};
    var _payload = json.encode(object);

    var response = await client.delete(url,headers: _headers);
    if (response.statusCode == 201) {
      var json = response.body;
      userFromJson(json);
      return userFromJson(json);
    }
  }
}