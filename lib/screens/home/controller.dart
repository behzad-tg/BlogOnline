import 'package:blog_online/screens/home/models.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  Dio dio = Dio();
  RxList blogList = <Blog>[].obs;
  
  getBlog() async {
    try {
      blogList.clear();
      var response = await dio.get('https://api.freerealapi.com/blogs');
      if (response.statusCode == 200) {
        final jsonlist = response.data['blogs'].map((obj)=> Blog.fromJson(obj));
        for (var obj in jsonlist){
          blogList.add(obj);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
