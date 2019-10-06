import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:meditasyon_app/models/login.dart' as prefix0;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/user.dart' show User;
import '../models/lesson.dart';
import '../models/register.dart' show Register;
import '../models/login.dart' show UserLogin;
import '../utils/utils.dart';

class UserRepository {
  final User user;

  UserRepository(this.user);

  Lesson getLastLesson() {
    return user.inProgress.keys.toList()[0];
  }

  static Future<Register> register(String email, String username,
      String password) async {
    final url = BASE_URL + "register";

    final response = await http.post(url, body: {
      'name': username,
      'email': email,
      'password': password,
    });

    final responseData = jsonDecode(response.body);

    print(responseData);

    if (responseData["success"]) {
      // Create new user
      return Register.fromJson(responseData);
    } else {
      // Show snackbar with error message
      return Register(success:false,message:responseData["message"],authInit:false);
    }
  }

  static Future<UserLogin> login(String email, String password) async {
    final url = BASE_URL + "login";

    final response = await http.post(url, body: {
      'email': email,
      'password': password,
    });

    final responseData = jsonDecode(response.body);

    if (responseData["success"]) {

      final userLogin = UserLogin.fromJson(responseData);
      final apiToken = userLogin.user.apiToken;
      SharedPreferences sp = await SharedPreferences.getInstance();
      await sp.setString("token", apiToken);
      return userLogin;

  }else{

      final userLogin = UserLogin(success:false,message:responseData["message"],user:null);


    return userLogin;

    }


  }


  static Future<bool> testAuth() async{

    print("AB");
    final url = BASE_URL+"testAuth";
    final sp = await SharedPreferences.getInstance();
    final apiKey = await sp.getString("token");

    final res = await http.post(url,headers: {
      'Authorization':'Bearer $apiKey'
    });

    final data = jsonDecode(res.body);

    print(data);
    return data["success"];

  }


}