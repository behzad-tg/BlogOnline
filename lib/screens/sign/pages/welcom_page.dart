import 'package:blog_online/animations/up_to_down_fade.dart';
import 'package:blog_online/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../conroller.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              UpToDownFade(
                delay: 0,
                child: Text(
                  'Free Real Api',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white54,
                  ),
                ),
              ),
              SizedBox(height: 10),
              UpToDownFade(
                delay: 0.2,
                child: Text(
                  'Flutter Tg',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            children: [
              UpToDownFade(
                delay: 0.4,
                child: InkWell(
                  onTap: () {
                    myTabController.tabController.index = 1;
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        )),
                    child: const Center(
                      child: Text(
                        'SING IN',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              UpToDownFade(
                delay: 0.6,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'SING IN WITH FACEBOOK',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
