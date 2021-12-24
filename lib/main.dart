import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/sign/sign_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}
/// ---------------------------------------
/// instagram : @flutter_tg
/// ---------------------------------------
/// instagram : @flutter_tg
/// ---------------------------------------
/// instagram : @flutter_tg
/// ---------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignScreen(),
    );
  }
}


 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}