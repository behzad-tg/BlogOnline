import 'package:blog_online/animations/left_to_right_fade.dart';
import 'package:blog_online/animations/sing_btn_animation.dart';
import 'package:blog_online/animations/up_to_down_fade.dart';
import 'package:blog_online/const.dart';
import 'package:blog_online/screens/home/pages/home_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../conroller.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTabController myTabController = Get.put(MyTabController());
    SingAnimation singAnimation = Get.put(SingAnimation());
    SingController singController = Get.put(SingController());
    final _formKey = GlobalKey<FormState>();
    TextEditingController username = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return WillPopScope(
      onWillPop: () async {
        myTabController.tabController.index = 1;
        return false;
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            left: 20,
            top: 40,
            child: LeftToRightFade(
              delay: 1.2,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white10, shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {
                    myTabController.tabController.index = 1;
                  },
                  padding: const EdgeInsets.all(10),
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const UpToDownFade(
                    delay: 0,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  UpToDownFade(
                    delay: 0.2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: username,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Username',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter user name.';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  UpToDownFade(
                    delay: 0.4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.email_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: email,
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'E-mail',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter user name.';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  UpToDownFade(
                    delay: 0.6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(width: 3, color: primaryColor),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.password,
                            size: 30,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: password,
                              textAlign: TextAlign.center,
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'password',
                                hintStyle: TextStyle(color: Colors.white),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter user name.';
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  UpToDownFade(
                    delay: 0.8,
                    child: TextButton(
                      onPressed: () {
                        myTabController.tabController.index = 2;
                      },
                      child: const Text(
                        'I have an account',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          UpToDownFade(
            delay: 0.8,
            child: InkWell(
              onTap: () async {
                await singAnimation.controller.animateTo(0.15);
                if (_formKey.currentState!.validate()) {
                  var result = await singController.SingUp(
                      username.text, email.text, password.text);
                  if (result == true) {
                    await singAnimation.controller.forward();
                    Get.to(const HomePage());
                  } else {
                    await singAnimation.controller.reverse();
                  }
                } else {
                  await singAnimation.controller.reverse();
                }
              },
              child: SingBtnAnimation(
                width: MediaQuery.of(context).size.width,
                controller: singAnimation.controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
