import 'package:blog_online/const.dart';
import 'package:flutter/material.dart';

class SingBtnAnimation extends StatelessWidget {
  final double width;
  final AnimationController controller;
  final Animation<double> clickBox;
  final Animation<double> zoomOutBox;
  final Animation<double> radius;
  final Animation<Color?> color;
  SingBtnAnimation({Key? key, required this.controller, required this.width})
      : clickBox = Tween(begin: width - 40, end: 60.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.15, curve: Curves.fastOutSlowIn))),
        zoomOutBox = Tween(begin: 60.0, end: 1000.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 1, curve: Curves.fastOutSlowIn))),
        radius = Tween(begin: 50.0, end: 0.0).animate(CurvedAnimation(
            parent: controller,
            curve: const Interval(0.6, 1, curve: Curves.fastOutSlowIn))),
        color = ColorTween(begin: primaryColor, end: Colors.white).animate(
            CurvedAnimation(
                parent: controller,
                curve: const Interval(0.6, 1, curve: Curves.ease))),
        super(key: key);

  Widget myAnimation(BuildContext context, Widget? child) {
    return zoomOutBox.value >= 61
        ? Container(
            width: zoomOutBox.value,
            height: zoomOutBox.value,
            decoration: BoxDecoration(
                color: color.value,
                borderRadius: BorderRadius.all(Radius.circular(radius.value))),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: clickBox.value,
            height: 60,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(50))),
            child: Center(
              child: clickBox.value <= (width - 60)
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'SING IN',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: myAnimation);
  }
}
