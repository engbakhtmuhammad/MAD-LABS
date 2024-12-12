// Import necessary packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/post_controller.dart';
import 'upload.dart';






class FeedScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    controller.fetchPosts();

    return Scaffold(
      appBar: AppBar(title: Text('Feed')),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.posts.length,
          itemBuilder: (context, index) {
            final post = controller.posts[index];
            return Card(
              child: ListTile(
                leading: GestureDetector(
                  onLongPress: () => controller.downloadImage(post.imagePath),
                  child: Image.network(post.imagePath, width: 50, height: 50),
                ),
                title: Text(post.title),
                subtitle: Text(post.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(() => UploadScreen());
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Delete Post"),
                            content: Text("Are you sure you want to delete this post?"),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("No"),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.deletePost(post.id.toString(), post.imagePath);
                                  Navigator.pop(context);
                                },
                                child: Text("Yes"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => UploadScreen()),
        child: Icon(Icons.add),
      ),
    );
  }
}
