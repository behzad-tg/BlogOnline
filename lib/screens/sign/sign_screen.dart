import 'package:blog_online/screens/sign/conroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/sign_in_page.dart';
import 'pages/sing_up_page.dart';
import 'pages/welcom_page.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/welcom-background.png'),
              fit: BoxFit.cover),
        ),
        child: Container(
          color: Colors.black38,
          child: TabBarView(
            controller: myTabController.tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              WelcomPage(),
              SignInPage(),
              SingUpPage(),
            ],
          ),
        ),
      ),
    );
  }
}
