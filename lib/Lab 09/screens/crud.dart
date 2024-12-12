import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/post.dart';
import '../services/api.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final ApiService _apiService = ApiService();
  late Future<void> _initialDataFetch;
  List<Post> _postList = []; // Mutable list of posts
  List<Map<String, dynamic>> _userList = []; // Mutable list of users

  @override
  void initState() {
    super.initState();
    _initialDataFetch = _fetchData(); // Initialize data fetching
  }

  Future<void> _fetchData() async {
    try {
      final fetchedPosts = await _apiService.fetchPosts();
      final fetchedUsers = await _apiService.fetchUsers();
      setState(() {
        _postList = fetchedPosts;
        _userList = fetchedUsers;
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch data: $e');
    }
  }

  void _showPostDialog({Post? post, bool isEditing = false}) {
    final TextEditingController titleController =
        TextEditingController(text: post?.title ?? '');
    final TextEditingController bodyController =
        TextEditingController(text: post?.body ?? '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Post' : 'Add Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Body'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final title = titleController.text.trim();
              final body = bodyController.text.trim();

              Post posty =Post(id: post?.id??56, title: title, body: body);

              if (title.isEmpty || body.isEmpty) {
                Get.snackbar('Error', 'Both fields are required');
                return;
              }

              Navigator.pop(context); // Close the dialog

              if (isEditing && post != null) {
                // Edit Post
                try {
                  await _apiService.updatePost(post.id, posty);
                  setState(() {
                    final index = _postList.indexWhere((p) => p.id == post.id);
                    if (index != -1) {
                      _postList[index] = Post(id: post.id, title: title, body: body);
                    }
                  });
                  Get.snackbar('Success', 'Post updated successfully');
                } catch (e) {
                  Get.snackbar('Error', 'Failed to update post');
                }
              } else {
                // Add New Post
                try {
                  final newPost = await _apiService.createPost(posty);
                  setState(() {
                    _postList.insert(0, newPost);
                  });
                  Get.snackbar('Success', 'Post added successfully');
                } catch (e) {
                  Get.snackbar('Error', 'Failed to add post');
                }
              }
            },
            child: Text(isEditing ? 'Update' : 'Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: FutureBuilder<void>(
        future: _initialDataFetch,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              children: [
                // Users Display
                Expanded(
                  flex: 1,
                  child: _userList.isEmpty
                      ? const Center(child: Text('No Users Found'))
                      : ListView.builder(
                          itemCount: _userList.length,
                          itemBuilder: (context, index) {
                            final user = _userList[index];
                            return ListTile(
                              title: Text(user['name']),
                              subtitle: Text(user['email']),
                            );
                          },
                        ),
                ),
                // Posts Display
                Expanded(
                  flex: 2,
                  child: _postList.isEmpty
                      ? const Center(child: Text('No Posts Found'))
                      : ListView.builder(
                          itemCount: _postList.length,
                          itemBuilder: (context, index) {
                            final post = _postList[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Card(
                                child: ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.body),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Colors.blue),
                                        onPressed: () {
                                          _showPostDialog(
                                              post: post, isEditing: true);
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () async {
                                          try {
                                            await _apiService.deletePost(post.id);
                                            setState(() {
                                              _postList.removeAt(index);
                                            });
                                            Get.snackbar('Success',
                                                'Post deleted successfully');
                                          } catch (e) {
                                            Get.snackbar('Failed',
                                                'Failed to delete post');
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showPostDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
