import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/post_controller.dart';
import '../model/post.dart';

class UpdateScreen extends StatelessWidget {
  final Post post;
  final PostController postController = Get.find<PostController>();

  UpdateScreen({required this.post});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    titleController.text = post.title;
    descriptionController.text = post.description;

    return Scaffold(
      appBar: AppBar(
        title: Text("Update Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.image),
              label: Text("Change Image"),
              onPressed: () async {
                final image = ImagePicker().pickImage(source: ImageSource.gallery);
                if (image != null) selectedImage = image as XFile?;
              },
            ),
            Spacer(),
            ElevatedButton(
              child: Text("Update"),
              onPressed: () {
                postController.updatePost(post.id.toString(), titleController.text, descriptionController.text, selectedImage as File?);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
