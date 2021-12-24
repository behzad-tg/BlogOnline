import 'package:blog_online/animations/down_to_up_fade.dart';
import 'package:blog_online/animations/up_to_down_fade.dart';
import 'package:blog_online/screens/home/models.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Blog obj;
  const DetailPage({Key? key, required this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          obj.image == null
              ? Container(
                  color: Colors.grey,
                )
              : SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width,
                  child: Image.network(
                    obj.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DowToUpFade(
                  delay: 0.8,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    decoration: const BoxDecoration(
                        color: Colors.white10, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                DowToUpFade(
                  delay: 0.6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children:  [
                        const Icon(Icons.person_outline_rounded,
                            size: 18, color: Colors.white),
                        Text(
                          obj.user.name,
                          style: const TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                 DowToUpFade(
                   delay: 0.4,
                   child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      obj.title,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                                 ),
                 ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                      const SizedBox(height: 20),
                       DowToUpFade(
                         delay: 0.2,
                         child: Text(
                          obj.text,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                                             ),
                       ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
