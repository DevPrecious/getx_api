import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controllers/post_controller.dart';
import 'package:getx_api/views/widgets/post_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostController _postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Getx API'),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return _postController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return PostWidget(
                          title: _postController.posts.value[index].title!,
                          text: _postController.posts.value[index].body!,
                        );
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
