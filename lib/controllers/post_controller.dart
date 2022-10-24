import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_api/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  Future getAllProducts() async {
    try {
      isLoading.value = true;
      final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      final http.Response response = await http.get(
        url,
        headers: {
          'Accept': 'Application/json',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        print(json.decode(response.body));
        final content = json.decode(response.body);
        for (var item in content) {
          posts.value.add(PostModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        print(json.decode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
