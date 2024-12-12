import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../model/post.dart';

class PostController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  final RxList<Post> posts = <Post>[].obs;

  /// Fetch posts from Firestore
  Future<void> fetchPosts() async {
    try {
      final snapshot = await _firestore.collection('posts').get();
      posts.value = snapshot.docs.map((doc) {
        final data = doc.data();
        return Post.fromJson({...data, 'id': doc.id});
      }).toList();
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch posts: ${e}");
    }
  }

  /// Add a new post with image
  Future<void> addPost(String title, String description, File imageFile) async {
    try {
      // Upload image to Firebase Storage
      final storageRef = _firebaseStorage
          .ref()
          .child('post_images/${DateTime.now().millisecondsSinceEpoch}');
      final uploadTask = await storageRef.putFile(imageFile);
      final imageUrl = await uploadTask.ref.getDownloadURL();

      // Add post information to Firestore
      final docRef = await _firestore.collection('posts').add({
        'title': title,
        'description': description,
        'imagePath': imageUrl,
      });

      // Add locally for state management
      posts.add(Post(
        id: docRef.id.hashCode,
        title: title,
        description: description,
        imagePath: imageUrl,
      ));
    } catch (e) {
      Get.snackbar("Error", "Failed to add post: $e");
    }
  }

  /// Update an existing post
  Future<void> updatePost(
      String docId, String title, String description, File? imageFile) async {
    try {
      String? imageUrl;

      // If a new image is provided, upload to Firebase Storage
      if (imageFile != null) {
        final storageRef = _firebaseStorage
            .ref()
            .child('post_images/${DateTime.now().millisecondsSinceEpoch}');
        final uploadTask = await storageRef.putFile(imageFile);
        imageUrl = await uploadTask.ref.getDownloadURL();
      }

      // Update Firestore document
      final updatedData = {
        'title': title,
        'description': description,
        if (imageUrl != null) 'imagePath': imageUrl,
      };
      await _firestore.collection('posts').doc(docId).update(updatedData);

      // Update locally
      final index = posts.indexWhere((post) => post.id == docId.hashCode);
      if (index != -1) {
        posts[index] = Post(
          id: docId.hashCode,
          title: title,
          description: description,
          imagePath: imageUrl ?? posts[index].imagePath,
        );
        posts.refresh();
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update post: $e");
    }
  }

  /// Delete a post
  Future<void> deletePost(String docId, String imagePath) async {
    try {
      // Delete image from Firebase Storage
      final storageRef = _firebaseStorage.refFromURL(imagePath);
      await storageRef.delete();

      // Delete post from Firestore
      await _firestore.collection('posts').doc(docId).delete();

      // Remove locally
      posts.removeWhere((post) => post.id == docId.hashCode);
    } catch (e) {
      Get.snackbar("Error", "Failed to delete post: $e");
    }
  }

  /// Download image to the device
  Future<void> downloadImage(String imageUrl) async {
    try {
      // Get the file's bytes
      final response = await _firebaseStorage.refFromURL(imageUrl).getData();

      // Write bytes to a file (update path for the app's storage directory)
      final directory = await getExternalStorageDirectory();
      final filePath =
          "${directory!.path}/${DateTime.now().millisecondsSinceEpoch}.png";
      final file = File(filePath);
      await file.writeAsBytes(response!);

      Get.snackbar("Success", "Image downloaded to $filePath");
    } catch (e) {
      Get.snackbar("Error", "Failed to download image: $e");
    }
  }
}
