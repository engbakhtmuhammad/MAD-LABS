import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controller/post_controller.dart';

class UploadScreen extends StatelessWidget {
  final PostController controller = Get.put(PostController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 10),
            selectedImage == null
                ? Text("No image selected.")
                : Image.file(selectedImage!, height: 150),
            ElevatedButton(
              onPressed: () async {
                selectedImage = ImagePicker().pickImage(source: ImageSource.gallery) as File?;
                (context as Element).markNeedsBuild();
              },
              child: Text("Select Image"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedImage != null) {
                  controller.addPost(
                    titleController.text,
                    descriptionController.text,
                    selectedImage!,
                  );
                }
              },
              child: Text("Upload Post"),
            ),
          ],
        ),
      ),
    );
  }
}