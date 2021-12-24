// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.onInit();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}

class SingAnimation extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void onInit() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.onInit();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class SingController extends GetxController {
  Dio dio = Dio();

  SingUp(String username, String email, String password) async {
    try {
      var response = await dio.post('https://api.freerealapi.com/auth/register',
        data: {"name": username, "email": email, "password": password});
      print(response.statusCode);
      if(response.statusCode == 201){
        return true;
      }else {
        return false;
      }
    } catch (e){
      print(e);
      return false;
    }
  }

  SingIn(String email, String password) async {
    try {
      var response = await dio.post('https://api.freerealapi.com/auth/login',
        data: {"email": email, "password": password});
      if(response.statusCode == 200){
        return true;
      }else {
        return false;
      }
    } catch (e){
      print(e);
      return false;
    }
  }
}
