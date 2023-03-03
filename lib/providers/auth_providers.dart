//authproviders untuk request ke api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jobsapp/models/user_models.dart';

class AuthProvider with ChangeNotifier {
  Future<UserModel?> register(
      String email, String password, String name, String goal) async {
    try {
      var body = {
        'email': email,
        'password': password,
        'name': name,
        'goal': goal
      };

      var response = await http.post(
        Uri.parse('https://future-jobs-api.vercel.app/register'),
        body: body,
      );
      // ignore: avoid_print
      print(response.statusCode);
      // ignore: avoid_print
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }

  Future<UserModel?> login(
    String email,
    String password,
  ) async {
    try {
      var body = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('https://future-jobs-api.vercel.app/login'),
        body: body,
      );
      // ignore: avoid_print
      print(response.statusCode);
      // ignore: avoid_print
      print(response.body);

      if (response.statusCode == 200) {
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return null;
    }
  }
}
